defmodule CongressApi.Votes do
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://api.propublica.org/congress/v1/"
  plug WRM.Tesla.FormatResponse
  plug Tesla.Middleware.JSON

  plug Tesla.Middleware.Headers,
       [
         {"X-API-Key",
          Application.get_env(:who_represents_me, :congress_api, :api_key)
          |> Keyword.get(:api_key)}
       ]

  def member_positions(propublica_id) do
    {:ok, result} = get("/members/#{propublica_id}/votes.json") |> CongressApi.get_result()

    {:ok,
     (fn r ->
        r |> List.first() |> Map.get("votes", [])
      end).(result)}
  end
end
