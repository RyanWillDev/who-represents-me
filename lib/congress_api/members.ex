defmodule CongressApi.Members do
  @key Application.get_env(:who_represents_me, :congress_api, :api_key)
       |> Keyword.get(:api_key)

  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://api.propublica.org/congress/v1/"
  plug WRM.Tesla.FormatResponse
  plug Tesla.Middleware.JSON

  plug Tesla.Middleware.Headers,
       [
         {"X-API-Key", @key}
       ]

  def get(chamber, term) do
    url = ["", Integer.to_string(term), chamber, "members.json"] |> Enum.join("/")

    {:ok, %{"results" => [%{"members" => members}]}} = get(url)

    {:ok,
     members
     |> Enum.filter(&(&1["in_office"] == true))
     |> Enum.map(&Map.merge(&1, %{"chamber" => chamber, "term" => term}))}
  end

  def details(member_id) do
    {:ok, %{"results" => [member]}} = get("/members/#{member_id}.json")
    {:ok, member}
  end
end
