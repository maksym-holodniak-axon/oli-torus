defmodule OliWeb.Delivery.Student.Discussion do
  use OliWeb, :live_view

  import OliWeb.Components.Delivery.Layouts

  alias OliWeb.Components.Delivery.DiscussionPost
  alias Oli.Resources.Collaboration

  @posts_limit 5

  def mount(
        _params,
        _session,
        socket
      ) do
    current_user_id = socket.assigns.current_user.id
    section_id = socket.assigns.section.id

    last_posts_user =
      Collaboration.list_lasts_posts_for_user(current_user_id, section_id, @posts_limit)

    last_posts_section =
      Collaboration.list_lasts_posts_for_section(current_user_id, section_id, @posts_limit)

    {:ok,
     assign(socket,
       last_posts_user: last_posts_user,
       last_posts_section: last_posts_section
     )}
  end

  def render(assigns) do
    ~H"""
    <.header_with_sidebar_nav
      ctx={@ctx}
      section={@section}
      brand={@brand}
      is_preview_mode={@is_preview_mode}
      active_tab={:discussion}
    >
      <div class="container mx-auto px-10 py-8">
        <h3>Discussion Board</h3>

        <DiscussionPost.render
          last_posts={@last_posts_user}
          title="Your Latest Discussion Activity"
          section_slug={@section.slug}
        />
        <DiscussionPost.render
          last_posts={@last_posts_section}
          title="All Discussion Activity"
          section_slug={@section.slug}
        />
      </div>
    </.header_with_sidebar_nav>
    """
  end
end
