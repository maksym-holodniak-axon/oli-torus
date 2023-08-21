defmodule OliWeb.Breadcrumb.BreadcrumbLive do
  use OliWeb, :live_component
  import Phoenix.HTML.Link
  import Ecto.Query, warn: false

  alias Oli.Repo

  alias OliWeb.Common.Breadcrumb
  alias Oli.Branding.CustomLabels
  alias Oli.Resources.Numbering
  alias Oli.Resources.Resource
  alias Oli.Resources.Revision
  alias Oli.Publishing.Publications.Publication
  alias Oli.Publishing.PublishedResource
  alias Oli.Authoring.Course.Project
  alias Oli.Delivery.Hierarchy.HierarchyNode

  def render(assigns) do
    render_breadcrumb(assigns)
  end

  defp render_breadcrumb(%{is_last: true} = assigns) do
    ~H"""
    <li class="breadcrumb-item active" aria-current="page">
      <%= get_title(@breadcrumb, @show_short) %>
      <%= render_dropdowns(assigns) %>
    </li>
    """
  end

  defp render_breadcrumb(%{breadcrumb: %{link: nil}} = assigns) do
    ~H"""
    <li class="breadcrumb-item">
      <%= get_title(@breadcrumb, @show_short) %>
      <span><i class="fas fa-angle-right ml-1"></i></span>
      <%= render_dropdowns(assigns) %>
    </li>
    """
  end

  defp render_breadcrumb(%{is_last: false} = assigns) do
    ~H"""
    <li class="breadcrumb-item">
      <%= link get_title(@breadcrumb, @show_short),
          to: @breadcrumb.link %>
      <span><i class="fas fa-angle-right ml-1"></i></span>
      <%= render_dropdowns(assigns) %>
    </li>
    """
  end

  defp render_dropdowns(%{breadcrumb: %{dropdowns: []}} = assigns), do: ""

  defp render_dropdowns(%{breadcrumb: %{dropdowns: _}} = assigns) do
    ~H"""
    <ul class="breadcrumb-dropdowns">
      <%= for dropdown <- @breadcrumb.dropdowns do %>
        <%= render_link(assigns, dropdown.item, dropdown.link) %>
      <% end %>
    </ul>
    """
  end

  def render_link(assigns, item, link) do
    container_type_id = Oli.Resources.ResourceType.get_id_by_type("container")

    case item.revision.resource_type_id do
      ^container_type_id ->
        render_container_link(assigns, item, link)

      _ ->
        render_page_link(assigns, item, link)
    end
  end

  defp prefix(item) do
    case item.numbering.level do
      1 -> "#{item.numbering.labels.unit} #{item.numbering.index}:"
      2 -> "#{item.numbering.labels.module} #{item.numbering.index}:"
      _ -> "#{item.numbering.labels.section} #{item.numbering.index}:"
    end
  end

  def render_container_link(assigns, item, link) do
    ~H"""
    <li><strong><a style={margin(item)} href={link}><%= prefix(item)%> <%= item.revision.title %></a></strong></li>
    """
  end

  def render_page_link(assigns, item, link) do
    ~H"""
    <li><a style={margin(item)} href={link}><%= item.revision.title %></a></li>
    """
  end

  defp margin(item) do
    "margin-left: #{(item.numbering.level - 1) * 10}px;"
  end


  defp get_title(%Breadcrumb{short_title: short_title}, true = _show_short), do: short_title
  defp get_title(%Breadcrumb{full_title: full_title}, false = _show_short), do: full_title

  defp project_working_publication(id) do
    from(p in Publication,
      join: c in Project,
      on: p.project_id == c.id,
      where: is_nil(p.published) and c.id == ^id,
      select: p.id
    )
  end

  def full_hierarchy(%Oli.Authoring.Course.Project{id: id} = project) do

    page_id = Oli.Resources.ResourceType.get_id_by_type("page")
    container_id = Oli.Resources.ResourceType.get_id_by_type("container")

    hierarchy = from(m in PublishedResource,
        join: rev in Revision,
        on: rev.id == m.revision_id,
        join: pub in Publication,
        on: m.publication_id == pub.id,
        where:
          m.publication_id in subquery(project_working_publication(id)) and
            (rev.resource_type_id == ^page_id or rev.resource_type_id == ^container_id),
        select: %{
          resource_id: rev.resource_id,
          children: rev.children,
          title: rev.title,
          resource_type_id: rev.resource_type_id,
          graded: rev.graded,
          root_resource_id: pub.root_resource_id
        }
      )
      |> Repo.all()

    case hierarchy do
      [] -> []
      [%{root_resource_id: root_resource_id} | _] ->

      revisions_by_resource_id = Enum.reduce(hierarchy, %{}, fn r, m -> Map.put(m, r.resource_id, r) end)
      root_revision = Map.get(revisions_by_resource_id, root_resource_id)

      numbering_tracker = Numbering.init_numbering_tracker()
      level = 0

      {all_nodes, _numbering_tracker} =
        hierarchy_node_with_children(
          root_revision,
          project,
          revisions_by_resource_id,
          numbering_tracker,
          level
        )

      all_nodes
    end


  end

  def hierarchy_node_with_children(
        revision,
        project,
        revisions_by_resource_id,
        numbering_tracker,
        level
      ) do
    {numbering_index, numbering_tracker} =
      Numbering.next_index(numbering_tracker, level, revision)

    {children, numbering_tracker} =
      Enum.reduce(
        revision.children,
        {[], numbering_tracker},
        fn resource_id, {nodes, numbering_tracker} ->
          {node, numbering_tracker} =
            hierarchy_node_with_children(
              revisions_by_resource_id[resource_id],
              project,
              revisions_by_resource_id,
              numbering_tracker,
              level + 1
            )

          {[node | nodes], numbering_tracker}
        end
      )
      # it's more efficient to append to list using [node | nodes] and
      # then reverse than to concat on every reduce call using ++
      |> then(fn {children, numbering_tracker} ->
        {Enum.reverse(children), numbering_tracker}
      end)

    labels =
      case project.customizations do
        nil -> Map.from_struct(CustomLabels.default())
        l -> Map.from_struct(l)
      end

    {
      [
        %HierarchyNode{
          uuid: uuid(),
          numbering: %Numbering{
            index: numbering_index,
            level: level,
            labels: labels
          },
          children: children,
          resource_id: revision.resource_id,
          project_id: project.id,
          revision: revision,
          section_resource: nil
        }
       | children
      ],
      numbering_tracker
    }
  end


end
