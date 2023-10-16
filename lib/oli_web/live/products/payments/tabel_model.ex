defmodule OliWeb.Products.Payments.TableModel do
  use Phoenix.Component

  alias OliWeb.Common.Table.{ColumnSpec, SortableTableModel, Common}
  alias OliWeb.Router.Helpers, as: Routes

  def new(payments, ctx) do
    inserted_at_spec = %ColumnSpec{
      name: :generation_date,
      label: "Created Date",
      render_fn: &Common.render_date/3,
      sort_fn: &__MODULE__.sort_date/2
    }

    SortableTableModel.new(
      rows: payments,
      column_specs: [
        %ColumnSpec{
          name: :type,
          label: "Type",
          render_fn: &__MODULE__.render_type_column/3,
          sort_fn: &__MODULE__.sort/2,
          td_class: "text-center text-nowrap"
        },
        inserted_at_spec,
        %ColumnSpec{
          name: :application_date,
          label: "Application Date",
          render_fn: &Common.render_date/3,
          sort_fn: &__MODULE__.sort_date/2
        },
        %ColumnSpec{
          name: :details,
          label: "Details",
          render_fn: &__MODULE__.render_details_column/3
        },
        %ColumnSpec{
          name: :user,
          label: "User",
          render_fn: &__MODULE__.render_user_column/3,
          td_class: "text-center text-nowrap"
        },
        %ColumnSpec{
          name: :section,
          label: "Section",
          render_fn: &__MODULE__.render_section_column/3,
          td_class: "text-center text-nowrap"
        }
      ],
      event_suffix: "",
      id_field: [:unique_id],
      sort_by_spec: inserted_at_spec,
      sort_order: :desc,
      data: %{
        ctx: ctx
      }
    )
  end

  def render_section_column(assigns, %{section: section}, _) do
    case section do
      nil ->
        ""

      _section ->
        assigns = Map.merge(assigns, %{section: section})

        ~H"""
        <a
          href={
            Routes.live_path(
              OliWeb.Endpoint,
              OliWeb.Delivery.InstructorDashboard.InstructorDashboardLive,
              @section.slug,
              :overview
            )
          }
          class="link"
        >
          <span><%= @section.title %></span>
        </a>
        """
    end
  end

  def render_user_column(assigns, %{user: user, section: section}, _) do
    case user do
      nil ->
        ""

      user ->
        assigns = Map.merge(assigns, %{section: section, user: user})

        ~H"""
        <a
          href={
            Routes.live_path(
              OliWeb.Endpoint,
              OliWeb.Delivery.StudentDashboard.StudentDashboardLive,
              @section.slug,
              @user.id,
              :content
            )
          }
          class="link"
        >
          <span>
            <%= "#{safe_get(@user.family_name, "Unknown")}, #{safe_get(@user.given_name, "Unknown")}" %>
          </span>
        </a>
        """
    end
  end

  defp safe_get(item, default_value) do
    case item do
      nil -> default_value
      item -> item
    end
  end

  def render_type_column(assigns, %{payment: payment, code: code}, _) do
    assigns = Map.merge(assigns, %{payment: payment, code: code})

    case payment.type do
      :direct ->
        ~H"""
        <div>
          Direct: <span class="badge badge-success"><%= @payment.provider_type %></span>
        </div>
        """

      :deferred ->
        ~H"""
        <div>
          Code: <code><%= @code %></code>
        </div>
        """
    end
  end

  def render_details_column(assigns, %{payment: payment}, _) do
    case {payment.type, payment.provider_type} do
      {:direct, :stripe} ->
        assigns = Map.merge(assigns, %{payment: payment})

        ~H"""
        <a
          href={"https://dashboard.stripe.com/test/payments/#{@payment.provider_payload["id"]}"}
          class="link"
        >
          View <i class="fas fa-external-link-alt ml-1"></i>
        </a>
        """

      _ ->
        ""
    end
  end

  def sort(direction, _) do
    {fn v ->
       case v.payment.type do
         :direct -> "zzzDirect: #{v.payment.provider_type}"
         :deferred -> "Code: [#{v.code}]"
       end
     end, direction}
  end

  def sort_date(direction, spec) do
    {fn r ->
       case Map.get(r.payment, spec.name) do
         nil ->
           0

         d ->
           DateTime.to_unix(d)
       end
     end, direction}
  end

  def render(assigns) do
    ~H"""
    <div>nothing</div>
    """
  end
end
