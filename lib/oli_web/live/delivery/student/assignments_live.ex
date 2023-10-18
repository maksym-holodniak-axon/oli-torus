defmodule OliWeb.Delivery.Student.AssignmentsLive do
  use OliWeb, :live_view

  import OliWeb.Components.Delivery.Layouts

  alias OliWeb.Common.FormatDateTime
  alias Oli.Delivery.Sections

  def mount(_params, _session, socket) do
    assignments =
      Sections.get_graded_pages(socket.assigns.section.slug, socket.assigns.ctx.user.id)

    {:ok, assign(socket, assignments: assignments)}
  end

  def render(assigns) do
    ~H"""
    <.header_with_sidebar_nav
      ctx={@ctx}
      section={@section}
      brand={@brand}
      preview_mode={@preview_mode}
      active_tab={:assignments}
    >
      <div class="container mx-auto px-10 py-8">
        <h3>Assignments</h3>
        <p>Find all your assignments, quizzes and activities associated with graded material.</p>

        <Components.Delivery.Assignments.list
          assignments={@assignments}
          section={@section}
          preview_mode={false}
          format_datetime_fn={
            fn datetime ->
              FormatDateTime.date(datetime, ctx: @ctx, precision: :minutes)
            end
          }
        />
      </div>
    </.header_with_sidebar_nav>
    """
  end
end
