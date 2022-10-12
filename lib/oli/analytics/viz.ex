defmodule Oli.Analytics.Viz do
  import Ecto.Query, warn: false
  alias Oli.Repo
  alias Oli.Delivery.Snapshots.Snapshot
  alias Oli.Delivery.Attempts.Core.PartAttempt

  @type scope ::
          {:project_id, integer()}
          | {:section_id, integer()}

  @spec by_activity(integer, scope()) :: {:ok, [map()]}
  def by_activity(activity_id, scope) do
    filter_by_scope =
      case scope do
        {:project_id, project_id} -> dynamic([s, _], s.project_id == ^project_id)
        {:section_id, section_id} -> dynamic([s, _], s.section_id == ^section_id)
      end

    query =
      Snapshot
      |> join(:left, [s], p in PartAttempt, on: s.part_attempt_id == p.id)
      |> where(^filter_by_scope)
      |> where([s, _], s.activity_id == ^activity_id)
      |> limit(1000)
      |> distinct([s, _], [s.part_attempt_id, s.part_id])
      |> select([s, p], %{
        correct: s.correct,
        pNum: s.part_attempt_number,
        aNum: s.attempt_number,
        rNum: s.resource_attempt_number,
        input: p.response["input"],
        hints: s.hints,
        score: s.score,
        outOf: s.out_of,
        revId: s.revision_id,
        secId: s.section_id
      })

    {:ok, Repo.all(query)}
  end
end
