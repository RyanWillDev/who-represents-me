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
    term = if is_number(term), do: Integer.to_string(term), else: term
    url = ["", term, chamber, "members.json"] |> Enum.join("/")

    {:ok, %{"results" => [%{"members" => members}]}} = get(url)

    {:ok,
     members
     |> Enum.filter(&(&1["in_office"] == true))
     |> Enum.map(&Map.merge(&1, %{"chamber" => chamber, "term" => term}))}
  end

  def get(propublica_id, chamber, term) do
    member =
      get(chamber, term) |> elem(1) |> Enum.filter(&(&1["id"] == propublica_id)) |> List.first()

    {:ok, member}
  end

  def details(propublica_id, chamber, term) do
    votes =
      Task.async(fn ->
        get(propublica_id, chamber, term) |> elem(1) |> separate_vote_data()
      end)

    {:ok, Task.yield_many([votes]) |> CongressApi.format_member_details()}
  end

  defp separate_vote_data(member) do
    vote_keys = [
      "total_votes",
      "votes_with_party_pct",
      "missed_votes_pct",
      "missed_votes",
      "number_missed_votes"
    ]

    vote_data = Map.take(member, vote_keys)

    Map.drop(member, vote_keys) |> Map.merge(%{"votes" => vote_data})
  end
end
