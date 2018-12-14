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
    get("/" <> Integer.to_string(term) <> "/house/members.json")
  end

  def senators_by_term(term) do
    get("/" <> Integer.to_string(term) <> "/senate/members.json")
  end
end
