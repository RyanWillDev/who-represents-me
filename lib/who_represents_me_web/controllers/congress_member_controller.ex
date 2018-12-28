defmodule WRMWeb.CongressMemberController do
  use WRMWeb, :controller
  alias CongressApi.{Bills, Members, Votes}

  action_fallback(WRMWeb.FallbackController)

  def details(conn, params) do
    with member <- WRM.Congress.get_member(params),
         true <- not is_nil(member) do
      render(conn, "details.html", member: member)
      # TODO (RW): Need to add an else case and handle the error here
    end
  end

  def member_details(conn, %{
        "propublica_id" => propublica_id,
        "chamber" => chamber,
        "term" => term
      }) do
    tasks = [
      Task.async(fn -> Votes.member_positions(propublica_id) end),
      Task.async(fn -> Members.get_one(propublica_id, chamber, term) end),
      Task.async(fn -> Bills.for_member(propublica_id) end)
    ]

    with [{_, {:ok, votes}}, {_, {:ok, member}}, {_, {:ok, bills}}] <- Task.yield_many(tasks) do
      details =
        (fn votes, member ->
           vote_keys = [
             "total_votes",
             "votes_with_party_pct",
             "missed_votes_pct",
             "missed_votes",
             "number_missed_votes"
           ]

           votes_data = Map.take(member, vote_keys)
           votes = Map.merge(%{"positions" => votes}, votes_data)

           Map.drop(member, vote_keys) |> Map.merge(%{"votes" => votes})
         end).(votes, elem(member, 1))
        |> Map.merge(%{"bills" => bills})

      render(conn, "member_details.json", details: details)
    else
      error ->
        error
    end
  end
end
