defmodule Oli.Delivery.Paywall.Providers.Cashnet do

  alias Oli.Delivery.Sections.Section
  alias Oli.Accounts.User

  @doc """
  Creates a Cashnet pending payment
  """
  @spec create_intent(%Section{}, %User{}) :: {:ok, any} | {:error, any}
  def create_intent(section, user) do
    if Oli.Delivery.Sections.is_enrolled?(user.id, section.slug) do
      Oli.Delivery.Paywall.create_pending_payment(user, section, %{
        type: :direct,
        generation_date: DateTime.utc_now(),
        amount: section.amount,
        provider_payload: %{},
        provider_id: UUID.uuid4(),
        provider_type: :cashnet,
        section_id: section.id
      })
    else
      {:error, :not_enrolled}
    end
  end

  @doc """
  Finalize a pending payment, given the Cashnet result.

  Finalization first involves ensuring that the intent corresponds to a payment
  in the system that has not yet been applied.  It then applies that
  payment be setting the application date and by linking it to an enrollment.
  """
  def finalize_payment(%{"ref1val1" => provider_id, "amount1" => amount} = response) do

    case Oli.Delivery.Paywall.get_provider_payment(:cashnet, provider_id) do
      nil ->
        {:error, "Payment does not exist"}

      %{application_date: nil} = payment ->
        section = Oli.Delivery.Sections.get_section!(payment.pending_section_id)

        case Oli.Delivery.Sections.get_enrollment(section.slug, payment.pending_user_id) do
          nil ->
            {:error, "Count not find enrollment to finalize payment"}

          enrollment ->

            cost =
              case Money.to_string(payment.amount) do
                {:ok, v} -> v
                _ -> Decimal.to_string(payment.amount)
              end

            if cost == amount do
              case Oli.Delivery.Paywall.update_payment(payment, %{
                enrollment_id: enrollment.id,
                application_date: DateTime.utc_now(),
                provider_payload: response
              }) do
                {:ok, _} -> {:ok, section}
                _ -> {:error, "Could not finalize payment"}
              end
            else
              {:error, "Payment discrepancy detected"}
            end

        end

      _ ->
        {:error, "Payment already finalized"}
    end

  end

end
