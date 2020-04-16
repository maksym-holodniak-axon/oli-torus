defmodule Oli.Editing.ResourceEditor do
  @moduledoc """
  This module provides content editing facilities for resources.

  """

  alias Oli.Locks
  alias Oli.Publishing
  alias Oli.Activities
  alias Oli.Activities.ActivityRevision
  alias Oli.Course
  alias Oli.Resources
  alias Oli.Accounts
  alias Oli.Resources.ResourceRevision
  alias Oli.Repo
  alias Oli.Learning

  @doc """
  Attempts to process an edit for a resource specified by a given
  project and revision slug, for the author specified by email.

  The update parameter is a map containing key-value pairs of the
  attributes of a ResourceRevision that are to be edited. It can
  contain any number of key-value pairs, but the keys must match
  the schema of `%ResourceRevision{}` struct.

  Not acquiring the lock here is considered a failure, as it is
  not an expected condition that a client would encounter. The client
  should have first acquired the lock via `acquire_lock`.

  Returns:

  .`{:ok, %ResourceRevision{}}` when the edit processes successfully the
  .`{:error, {:lock_not_acquired}}` if the lock could not be acquired or updated
  .`{:error, {:not_found}}` if the project, resource, or user cannot be found
  .`{:error, {:not_authorized}}` if the user is not authorized to edit this resource
  .`{:error, {:error}}` unknown error
  """
  @spec edit(String.t, String.t, String.t, %{})
    :: {:ok, %ResourceRevision{}} | {:error, {:not_found}} | {:error, {:error}} | {:error, {:lock_not_acquired}} | {:error, {:not_authorized}}
  def edit(project_slug, revision_slug, author_email, update) do

    with {:ok, author} <- Accounts.get_author_by_email(author_email) |> trap_nil(),
         {:ok, project} <- Course.get_project_by_slug(project_slug) |> trap_nil(),
         {:ok} <- authorize_user(author, project),
         {:ok, publication} <- Publishing.get_unpublished_publication(project_slug, author.id) |> trap_nil(),
         {:ok, resource} <- Resources.get_resource_from_slugs(project_slug, revision_slug) |> trap_nil()
    do
      Repo.transaction(fn ->

        case Locks.update(publication.id, resource.id, author.id) do

          # If we acquired the lock, we must first create a new revision
          {:acquired} -> get_latest_revision(publication, resource)
            |> create_new_revision(publication, resource, author.id)
            |> update_revision(convert_to_activity_ids(update))

          # A successful lock update means we can safely edit the existing revision
          {:updated} -> get_latest_revision(publication, resource)
            |> update_revision(convert_to_activity_ids(update))

          # error or not able to lock results in a failed edit
          result -> Repo.rollback(result)
        end

      end)

    else
      error -> error
    end

  end

  @doc """
  Attempts to lock a resource for editing.

  Not acquiring the lock here isn't considered a failure, as it is
  an expected condition that a user could encounter.

  Returns:

  .`{:acquired}` when the lock is acquired
  .`{:lock_not_acquired, user_email}` if the lock could not be acquired
  .`{:error, {:not_found}}` if the project, resource, or user cannot be found
  .`{:error, {:not_authorized}}` if the user is not authorized to edit this resource
  .`{:error, {:error}}` unknown error
  """
  @spec acquire_lock(String.t, String.t, String.t)
    :: {:acquired} | {:lock_not_acquired, String.t} | {:error, {:not_found}} | {:error, {:error}} | {:error, {:not_authorized}}
  def acquire_lock(project_slug, revision_slug, author_email) do

    with {:ok, author} <- Accounts.get_author_by_email(author_email) |> trap_nil(),
         {:ok, project} <- Course.get_project_by_slug(project_slug) |> trap_nil(),
         {:ok} <- authorize_user(author, project),
         {:ok, publication} <- Publishing.get_unpublished_publication(project_slug, author.id) |> trap_nil(),
         {:ok, resource} <- Resources.get_resource_from_slugs(project_slug, revision_slug) |> trap_nil()
    do
      case Locks.acquire(publication.id, resource.id, author.id) do

        # If we reacquired the lock, we must first create a new revision
        {:acquired} -> {:acquired}

        # error or not able to lock results in a failed edit
        {:lock_not_acquired, {locked_by, _}} -> {:lock_not_acquired, locked_by}

        error -> {:error, error}
      end
    else
      error -> error
    end

  end

  @doc """
  Attempts to release an edit lock.

  Returns:

  .`{:ok, {:released}}` when the lock is acquired
  .`{:error, {:error}` if an unknown error encountered
  .`{:error, {:not_found}}` if the project, resource, or user cannot be found
  .`{:error, {:not_authorized}}` if the user is not authorized to edit this resource
  """
  @spec release_lock(String.t, String.t, String.t)
    :: {:ok, {:released}} | {:error, {:not_found}} | {:error, {:not_authorized}} | {:error, {:error}}
  def release_lock(project_slug, revision_slug, author_email) do

    with {:ok, author} <- Accounts.get_author_by_email(author_email) |> trap_nil(),
         {:ok, project} <- Course.get_project_by_slug(project_slug) |> trap_nil(),
         {:ok} <- authorize_user(author, project),
         {:ok, publication} <- Publishing.get_unpublished_publication(project_slug, author.id) |> trap_nil(),
         {:ok, resource} <- Resources.get_resource_from_slugs(project_slug, revision_slug) |> trap_nil()
    do
      case Locks.release(publication.id, resource.id, author.id) do
        {:error} -> {:error, {:error}}
        _ -> {:ok, {:released}}
      end
    else
      error -> error
    end

  end



  @doc """
  Creates the context necessary to power a client side resource editor
  for a specific resource / revision.
  """
  def create_context(project_slug, revision_slug, author) do

    editor_map = Oli.Activities.create_registered_activity_map()

    with {:ok, publication} <- Publishing.get_unpublished_publication(project_slug, author.id) |> trap_nil(),
         {:ok, resource} <- Resources.get_resource_from_slugs(project_slug, revision_slug) |> trap_nil(),
         {:ok, objectives} <- Publishing.get_published_objectives(publication.id) |> trap_nil(),
         {:ok, %{content: content} = revision} <- get_latest_revision(publication, resource) |> trap_nil(),
         {:ok, objectives_without_ids} <- strip_ids(objectives) |> trap_nil(),
         {:ok, attached_objectives} <- id_to_slug(revision.objectives, objectives) |> trap_nil(),
         {:ok, activities} <- create_activities_map(publication.id, content)
    do
      {:ok, create(publication.id, revision, project_slug, revision_slug, author, objectives_without_ids, attached_objectives, activities, editor_map)}
    else
      _ -> {:error, :not_found}
    end
  end

  # From the array of maps found in a resource revision content, produce a
  # map of the content of the activity revisions that pertain to the
  # current publication
  defp create_activities_map(publication_id, content) do

    # Now see if we even have any activities that need to be mapped
    found_activities = Enum.filter(content, fn c -> Map.get(c, "type") == "activity-reference" end)
      |> Enum.map(fn c -> Map.get(c, "activity_id") end)

    if (length(found_activities) != 0) do

      # create a mapping of registered activity type id to the registered activity slug
      id_to_slug = Activities.list_activity_registrations() |> Enum.reduce(%{}, fn e, m -> Map.put(m, Map.get(e, :id), Map.get(e, :slug)) end)

      # find the published revisions for these activities, and convert them
      # to a form suitable for front-end consumption
      {:ok, Publishing.get_published_activity_revisions(publication_id, found_activities)
        |> Enum.map(fn %ActivityRevision{activity_type_id: activity_type_id, slug: slug, content: content} -> %{ type: "activity", typeSlug: Map.get(id_to_slug, activity_type_id), activitySlug: slug, model: content} end)
        |> Enum.reduce(%{}, fn e, m -> Map.put(m, Map.get(e, :activitySlug), e) end)}
    else
      {:ok, %{}}
    end

  end

  # Reverse references found in a resource update for activites. They will
  # come from the client as activity revision slugs, we store them internally
  # as activity ids
  defp convert_to_activity_ids(%{ "content" => content} = update) do

    found_activities = Enum.filter(content, fn c -> Map.get(c, "type") == "activity-reference" end)
      |> Enum.map(fn c -> Map.get(c, "activitySlug") end)

    slug_to_id = case found_activities do
      [] -> %{}
      activities -> Activities.get_activity_revisions(activities)
        |> Enum.reduce(%{}, fn e, m -> Map.put(m, Map.get(e, :slug), Map.get(e, :activity_id)) end)
    end

    convert = fn c ->
      if (Map.get(c, "type") == "activity-reference") do
        slug = Map.get(c, "activitySlug")
        Map.delete(c, "activitySlug") |> Map.put("activity_id", Map.get(slug_to_id, slug))
      else
        c
      end
    end

    Map.put(update, "content", Enum.map(content, convert))

  end

  defp convert_to_activity_ids(update) do
    update
  end

  defp convert_to_activity_slugs(content, publication_id) do

    found_activities = Enum.filter(content, fn c -> Map.get(c, "type") == "activity-reference" end)
      |> Enum.map(fn c -> Map.get(c, "activity_id") end)

    id_to_slug = case found_activities do
      [] -> %{}
      activities -> Publishing.get_published_activity_revisions(publication_id, activities)
        |> Enum.reduce(%{}, fn e, m -> Map.put(m, Map.get(e, :activity_id), Map.get(e, :slug)) end)
    end

    convert = fn c ->
      if (Map.get(c, "type") == "activity-reference") do
        id = Map.get(c, "activity_id")
        Map.delete(c, "activity_id") |> Map.put("activitySlug", Map.get(id_to_slug, id))
      else
        c
      end
    end

    Enum.map(content, convert)

  end

  # removes the objective_id from the maps contained with a list of objectives
  defp strip_ids(objectives) do
    Enum.map(objectives, fn o -> Map.delete(o, :objective_id) end)
  end

  # takes the attached objectives in the form of a list of objective ids
  # and converts it to a list of slugs, using all current objectives
  defp id_to_slug(attached_objectives, all_objectives) do
    map = Enum.reduce(all_objectives, %{}, fn o, m -> Map.put(m, Map.get(o, :objective_id), o) end)
    Enum.map(attached_objectives, fn o -> Map.get(map, o) |> Map.get(:slug) end)
  end


  defp create(publication_id, revision, project_slug, revision_slug, author, all_objectives, objectives, activities, editor_map) do
    %Oli.Editing.ResourceContext{
      authorEmail: author.email,
      projectSlug: project_slug,
      resourceSlug: revision_slug,
      editorMap: editor_map,
      objectives: objectives,
      allObjectives: all_objectives,
      title: revision.title,
      resourceType: revision.resource_type.type,
      content: convert_to_activity_slugs(revision.content, publication_id),
      activities: activities
    }
  end

  defp authorize_user(author, project) do
    case Accounts.can_access?(author, project) do
      true -> {:ok}
      false -> {:error, {:not_authorized}}
    end
  end

  defp trap_nil(result) do
    case result do
      nil -> {:error, {:not_found}}
      _ -> {:ok, result}
    end
  end

  defp get_latest_revision(publication, resource) do
    mapping = Publishing.get_resource_mapping!(publication.id, resource.id)
    revision = Resources.get_resource_revision!(mapping.revision_id)

    Repo.preload(revision, :resource_type)
  end

  defp create_new_revision(previous, publication, resource, author_id) do

    {:ok, revision} = Resources.create_resource_revision(%{
      children: previous.children,
      content: previous.content,
      objectives: previous.objectives,
      deleted: previous.deleted,
      slug: previous.slug,
      title: previous.title,
      author_id: author_id,
      resource_id: previous.resource_id,
      previous_revision_id: previous.id,
      resource_type_id: previous.resource_type_id
    })

    mapping = Publishing.get_resource_mapping!(publication.id, resource.id)
    {:ok, _mapping} = Publishing.update_resource_mapping(mapping, %{ revision_id: revision.id })

    revision
  end

  defp update_revision(revision, update) do

    converted_back_to_ids = case Map.get(update, "objectives") do
      nil -> update
      objectives -> Map.put(update, "objectives", Learning.get_ids_from_objective_slugs(objectives))
    end

    {:ok, updated} = Resources.update_resource_revision(revision, converted_back_to_ids)
    updated
  end

end

