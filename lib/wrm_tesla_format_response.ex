defmodule WRM.Tesla.FormatResponse do
  @behaviour Tesla.Middleware

  def call(env, next, _options) do
    env
    |> Tesla.run(next)
    |> format_response()
  end

  def format_response({:ok, %Tesla.Env{status: status, body: body}})
      when status >= 200 and status < 300 do
    {:ok, body}
  end

  def format_response({_, %Tesla.Env{body: body}}) do
    {:error, body}
  end
end
