defmodule OliWeb.PaymentProviders.CashnetController do
  use OliWeb, :controller

  alias Oli.Delivery.Paywall.Providers.Cashnet
  alias OliWeb.Router.Helpers, as: Routes

  require Logger

  @doc """
  Renders the page to start the direct payment processing flow via stripe.
  """
  def show(conn, section, user, %{amount: decimal} = amount) do
    Logger.debug("CashnetController:show", %{
      section_slug: section.slug,
      user_id: user.id,
      amount: amount
    })

    cost =
      case Money.to_string(amount) do
        {:ok, v} -> v
        _ -> Decimal.to_string(decimal)
      end

    case Cashnet.create_intent(section, user) do
      {:ok, payment} ->
        conn
        |> Phoenix.Controller.put_view(OliWeb.PaymentProviders.CashnetView)
        |> render("index.html",
          success_url: Routes.cashnet_url(conn, :success),
          failure_url: Routes.cashnet_url(conn, :failure),
          payment: payment,
          settings: %{
            store_number: Application.fetch_env!(:oli, :cashnet_provider)[:store_number],
            checkout_url: Application.fetch_env!(:oli, :cashnet_provider)[:checkout_url]
          },
          purchase: Jason.encode!(%{user_id: user.id, section_slug: section.slug}),
          section: section,
          cost: cost,
          first_name: safe_get(user.family_name, "Unknown"),
          last_name: safe_get(user.given_name, "Unknown"),
          user: user,
          user_name:
            safe_get(user.family_name, "Unknown") <> ", " <> safe_get(user.given_name, "Unknown")
        )
      _ ->
        conn
        |> redirect(to: Routes.page_delivery_path(conn, :index, section.slug))
    end
  end

  defp send_receipt_email(user, response) do
    email =
      Oli.Email.payment_receipt_email(
        user.email,
        :payment_receipt,
        %{
          response: response
        }
      )

    Oli.Mailer.deliver_now(email)
  end

  defp safe_get(item, default_value) do
    case item do
      nil -> default_value
      item -> item
    end
  end

  def success(conn, result) do
    case Cashnet.finalize_payment(result) do
      {:ok, section, payment} ->

        user = Oli.Accounts.get_user!(payment.pending_user_id)
        send_receipt_email(user, result)

        conn
        |> redirect(to: Routes.page_delivery_path(conn, :index, section.slug))
      {:error, reason} ->
        conn
        |> Phoenix.Controller.put_view(OliWeb.PaymentProviders.CashnetView)
        |> render("error.html",
          response: reason
        )
    end
  end

  def failure(conn, params) do
    Logger.error("Cashnet:failure", %{
      params: params
    })

    Cashnet.capture_failure(params)

    conn
    |> Phoenix.Controller.put_view(OliWeb.PaymentProviders.CashnetView)
    |> render("error.html",
      response: Map.get(params, "respmessage", "There was an unknown failure")
    )
  end

end
