defmodule CivicApi do
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://www.googleapis.com/civicinfo/v2"
  plug WRM.Tesla.FormatResponse

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
    response =
      get("/representatives",
        query: [
          address: address,
          levels: @rep_levels
        ]
      )

    case response do
      {:ok, body} ->
        {:ok, CivicApi.Formatter.representative_response(body)}

      error ->
        error
    end
  end
end
