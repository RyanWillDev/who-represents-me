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
["senate", "house"]
|> Enum.each(fn chamber ->
  CongressApi.Members.list(chamber, 116)
  |> elem(1)
  |> Enum.each(fn m ->
    m =
      Map.put(m, "propublica_id", m["id"])
      |> Map.drop(["id"])

    %WRM.Congress.Member{} |> WRM.Congress.Member.changeset(m) |> WRM.Repo.insert!()
  end)
end)
