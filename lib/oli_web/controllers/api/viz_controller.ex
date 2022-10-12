defmodule OliWeb.Api.VizController do
  use OliWeb, :controller
  alias Oli.Analytics.Viz

  @moduledoc tags: ["Viz Service"]

  @moduledoc """
  Provides endpoints to power data visualizations.
  """

  def by_activity(
        conn,
        %{
          "activityId" => activity_id,
          "dataSource" => dataSource
        }
      ) do
    # Things we will eventually want to do:
    # 1. Validate that the requesting user can access this
    # 2. Return cached results when present
    # 3. Have a more flexible "source" determination that can be project / section specific

    scope =
      case Map.get(dataSource, "type") do
        "BySection" ->
          {:section_id, conn.assigns.section.id}

        "ByProject" ->
          project = Oli.Authoring.Course.get_project_by_slug(dataSource["projectSlug"])
          {:project_id, project.id}

        _ ->
          {:project_id, conn.assigns.project.id}
      end

    case Viz.by_activity(activity_id, scope) do
      {:ok, results} ->
        json(conn, %{
          "result" => "success",
          "results" => results
        })

      {:error, {:not_found}} ->
        error(conn, 404, "not found")

      e ->
        {_, msg} = Oli.Utils.log_error("Could not retrieve viz data", e)
        error(conn, 500, msg)
    end
  end

  defp error(conn, code, reason) do
    conn
    |> send_resp(code, reason)
    |> halt()
  end
end
