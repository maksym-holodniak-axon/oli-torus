defmodule OliWeb.Delivery.Student.Content do
  use OliWeb, :live_view

  import OliWeb.Components.Delivery.Layouts

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.header_with_sidebar_nav
      ctx={@ctx}
      section={@section}
      brand={@brand}
      is_preview_mode={@is_preview_mode}
      active_tab={:content}
    >
      <div class="container mx-auto">
        Content
      </div>
    </.header_with_sidebar_nav>
    """
  end
end
