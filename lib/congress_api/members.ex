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

  def house_members_by_term(term) do
    {:ok, %{"results" => [%{"members" => members}]}} =
      get("/" <> Integer.to_string(term) <> "/house/members.json")

    {:ok, members |> Enum.filter(&(&1["in_office"] == true))}
  end

  def senators_by_term(term) do
    {:ok, %{"results" => [%{"members" => senators}]}} =
      get("/" <> Integer.to_string(term) <> "/senate/members.json")

    {:ok, senators |> Enum.filter(&(&1["in_office"] == true))}
  end
end
