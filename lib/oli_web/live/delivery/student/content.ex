defmodule OliWeb.Delivery.Student.Content do
  use OliWeb, :live_view

  import OliWeb.Components.Delivery.Layouts

  alias Oli.Delivery.Sections

  def mount(_params, _session, socket) do
    section =
      socket.assigns.section
      |> Oli.Repo.preload([:base_project, :root_section_resource])

    hierarchy = %{"children" => Sections.build_hierarchy(section).children}
    current_position = 0
    current_level = 0

    # Adjust the hierarchy in the case that there are only pages in the course, no containers
    hierarchy =
      OliWeb.Components.Delivery.CourseContent.adjust_hierarchy_for_only_pages(hierarchy)

    scheduled_dates =
      Sections.get_resources_scheduled_dates_for_student(
        section.slug,
        socket.assigns.ctx.user.id
      )

    {:ok,
     assign(socket,
       hierarchy: hierarchy,
       current_level_nodes: hierarchy["children"],
       current_position: current_position,
       current_level: current_level,
       scheduled_dates: scheduled_dates,
       breadcrumbs_tree: [{current_level, current_position, "Curriculum"}]
     )}
  end

  def render(assigns) do
    ~H"""
    <.header_with_sidebar_nav
      ctx={@ctx}
      section={@section}
      brand={@brand}
      preview_mode={@preview_mode}
      active_tab={:content}
    >
      <div class="container mx-auto px-10 py-8">
        <.live_component
          module={OliWeb.Components.Delivery.CourseContent}
          id="course_content_tab"
          ctx={@ctx}
          hierarchy={@hierarchy}
          current_position={@current_position}
          current_level={@current_level}
          current_level_nodes={@current_level_nodes}
          breadcrumbs_tree={@breadcrumbs_tree}
          section={@section}
          scheduled_dates={@scheduled_dates}
          current_user_id={@ctx.user.id}
          preview_mode={@preview_mode}
        />
      </div>
    </.header_with_sidebar_nav>
    """
  end
end
