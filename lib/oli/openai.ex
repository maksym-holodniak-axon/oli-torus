defmodule Oli.OpenAI do

  require Logger

  @completions_url "https://api.openai.com/v1/completions"

  def request(prompt, model, max_tokens, temperature \\ 0.3) do

    api_key = System.get_env("OPENAI_API_KEY")

    body = %{
      model: model,
      temperature: temperature,
      max_tokens: max_tokens,
      prompt: prompt
    } |> Jason.encode!()

    headers = fn api_key ->
      [
        Authorization: "Bearer #{api_key}",
        "Content-Type": "application/json"
      ]
    end

    case HTTPoison.post(@completions_url, body, headers.(api_key), [timeout: 30000, recv_timeout: 30000]) do
      {:ok, %{status_code: 200, body: body}} ->

        {:ok, body}
      e -> e
    end
  end

end
