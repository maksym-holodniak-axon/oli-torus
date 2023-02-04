defmodule OliWeb.Api.OpenAIController do
  use OliWeb, :controller

  alias Oli.OpenAI

  def prompt(conn, %{"prompt" => prompt}) do
    case OpenAI.request(prompt, "text-davinci-003", 1000) do
      {:ok, body} ->
        IO.inspect body
        body = Jason.decode!(body)
        body = body["choices"] |> hd |> Map.get("text")
        body = String.replace(body, "\\n", "")
        body = String.replace(body, "\n", "")
        body = String.replace(body, "  ", " ")
        body = String.replace(body, "question:", "\"question\":")
        body = String.replace(body, "options:", "\"options\":")
        body = String.replace(body, "option:", "\"option\":")
        body = String.replace(body, "isCorrect:", "\"isCorrect\":")

        IO.inspect body
        body = Jason.decode!(body)

        json(conn, %{"completion" => body, "result" => "success"})
      e ->
        IO.inspect e
        error(conn, 500, e)
    end
  end

  defp error(conn, code, reason) do
    conn
    |> send_resp(code, reason)
    |> halt()
  end
end
