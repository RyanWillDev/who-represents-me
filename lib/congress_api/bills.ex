defmodule CongressApi.Bills do
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

  def for_member(propublica_id) do
    {:ok, [%{"bills" => bills}]} =
      get("/members/#{propublica_id}/bills/introduced.json")
      |> CongressApi.get_result()

    {:ok, bills}
  end
end
