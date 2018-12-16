# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     WRM.Repo.insert!(%WRM.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

CongressApi.Members.senators_by_term(115)
|> elem(1)
|> Enum.each(fn s ->
  s =
    Map.put(s, "propublica_id", s["id"])
    |> Map.drop(["id"])

  %WRM.Congress.Senator{} |> WRM.Congress.Senator.changeset(s) |> WRM.Repo.insert!()
end)

CongressApi.Members.house_members_by_term(115)
|> elem(1)
|> Enum.each(fn m ->
  m =
    Map.put(m, "propublica_id", m["id"])
    |> Map.drop(["id"])

  %WRM.Congress.HouseMember{} |> WRM.Congress.HouseMember.changeset(m) |> WRM.Repo.insert!()
end)
