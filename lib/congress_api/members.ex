defmodule CongressApi.Members do
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

  def list(chamber, term) do
    term = if is_number(term), do: Integer.to_string(term), else: term
    url = ["", term, chamber, "members.json"] |> Enum.join("/")

    {:ok, %{"results" => [%{"members" => members}]}} = get(url)

    {:ok,
     members
     |> Enum.filter(&(&1["in_office"] == true))
     |> Enum.map(&Map.merge(&1, %{"chamber" => chamber, "term" => term}))}
  end

  def get_one(propublica_id, chamber, term) do
    member =
      list(chamber, term) |> elem(1) |> Enum.filter(&(&1["id"] == propublica_id)) |> List.first()

    {:ok, member}
  end
end
