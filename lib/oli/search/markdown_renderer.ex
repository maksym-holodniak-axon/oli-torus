defmodule Oli.Search.MarkdownRenderer do

  alias Oli.Resources.Revision
  alias Oli.Rendering.Context
  alias Oli.Search.RevisionEmbedding
  alias Oli.Rendering.Page

  def to_markdown(%Revision{resource_type_id: resource_type_id} = revision) do

    Oli.Resources.ResourceType.get_type_by_id(resource_type_id)
    |> to_markdown(revision)
  end

  defp to_markdown("page", %Revision{content: content, title: title, resource_id: resource_id} = revision) do

    # Render the resource to markdown
    markdown = ctx(revision)
    |> Page.render(content, Page.Markdown)
    |> :erlang.iolist_to_binary()

    # Chunk
    String.split(markdown, "\n\n")
    |> Enum.with_index(1)
    |> Enum.map(fn {chunk, ordinal} ->
      %RevisionEmbedding{
        revision_id: revision.id,
        resource_id: revision.resource_id,
        resource_type_id: revision.resource_type_id,
        component_type: :other,
        chunk_type: categorize_chunk(chunk),
        chunk_ordinal: ordinal,
        content: chunk,
        fingerprint_md5: :erlang.md5(chunk)
      }
    end)

  end

  defp to_markdown("activity", %Revision{content: content, title: title, resource_id: resource_id} = revision) do

    # Render the resource to markdown

    # Chunk

    #

    []
  end

  defp to_markdown(_, _) do
    []
  end

  defp ctx(%Revision{slug: slug} = revision) do
    %Context{
      revision_slug: slug,
      page_id: revision.resource_id
    }
  end

  defp categorize_chunk(chunk) do
    case String.trim(chunk) do
      "```" <> _  -> :code
      "![" <> _  -> :image
      "1. " <> _  -> :list
      "|" <> _  -> :table
      ">" <> _  -> :quote
      "$$" <> _  -> :formula
      "#" <> _  -> :heading
      "---" <> _  ->
        parts = String.split(chunk, "\n")
        case parts[0] do
          "##### Video" -> :video
          "##### Emerald Cloud Lab Code" -> :code
          "##### YouTube Video" -> :youtube
          "##### External WebPage IFRAME" -> :iframe
          "##### Audio Clip" -> :audio
          "##### Conjugation" -> :conjugation
          "##### Dialog" -> :dialog
          "##### Definition" -> :definition
          "##### Example" -> :example
          "##### Learn More" -> :group
          "##### Many Students Wonder" -> :group
          _ -> :other
        end
      _ -> :paragraph

    end
  end

end
