defmodule CivicApi do
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://www.googleapis.com/civicinfo/v2"

  plug Tesla.Middleware.Query,
    key: Application.get_env(:who_represents_me, :civic_api, :api_key) |> Keyword.get(:api_key)

  plug Tesla.Middleware.JSON

  @rep_levels [
    "administrativeArea1",
    "administrativeArea2",
    "country",
    "international",
    "locality",
    "regional",
    "special",
    "subLocality1",
    "subLocality2"
  ]

  def representatives(address) do
    {:ok, %Tesla.Env{body: body}} =
      get("/representatives",
        query: [
          address: address,
          levels: @rep_levels
        ]
      )

    offices =
      body["offices"]
      |> Enum.reduce(%{}, fn office, acc ->
        Enum.reduce(office["officialIndices"], %{}, fn index, index_acc ->
          Map.put(index_acc, to_string(index), Map.drop(office, ["officialIndices"]))
        end)
        |> Map.merge(acc)
      end)

    body["officials"]
    |> Enum.with_index()
    |> Enum.map(fn {official, index} ->
      official
      |> Map.merge(%{"office" => offices[to_string(index)]})
    end)
  end
end
