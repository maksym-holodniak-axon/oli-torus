defmodule OliWeb.Delivery.Student.ExplorationsLive do
  use OliWeb, :live_view

  import OliWeb.Components.Delivery.Layouts

  alias Oli.Publishing.DeliveryResolver
  alias OliWeb.Components.Delivery.ExplorationCard

  def mount(_params, _session, socket) do
    explorations = DeliveryResolver.get_by_purpose(socket.assigns.section.slug, :application)

    {:ok,
     assign(socket,
       explorations: explorations
     )}
  end

  def render(assigns) do
    ~H"""
    <.header_with_sidebar_nav
      ctx={@ctx}
      section={@section}
      brand={@brand}
      preview_mode={@preview_mode}
      active_tab={:explorations}
    >
      <div class="container mx-auto px-10 py-8">
        <h3 class="mb-4">Explorations</h3>

        <div class="flex flex-col gap-4">
          <%= if length(@explorations) > 0 do %>
            <%= for exploration <- @explorations do %>
              <ExplorationCard.render
                exploration={exploration}
                section_slug={@section.slug}
                preview_mode={@preview_mode}
              />
            <% end %>
          <% else %>
            <div class="bg-white dark:bg-gray-800 border-l-4 border-delivery-primary p-4" role="alert">
              <h6>There are no exploration pages available</h6>
            </div>
          <% end %>
        </div>
      </div>
    </.header_with_sidebar_nav>
    """
  end
end
