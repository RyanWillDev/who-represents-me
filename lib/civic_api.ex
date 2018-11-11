defmodule CivicApi do
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://www.googleapis.com/civicinfo/v2"

  plug Tesla.Middleware.Query,
    key: Application.get_env(:who_represents_me, :civic_api, :api_key) |> Keyword.get(:api_key)

  plug Tesla.Middleware.JSON

  def representatives(address) do
    get("/representatives",
      query: [
        address: address,
        levels: [
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
      ]
    )
  end
end
