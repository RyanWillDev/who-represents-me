defmodule WRMWeb.SearchController do
  use WRMWeb, :controller

  def search(conn, %{"address" => address, "state" => state, "zip" => zip}) do
    address = [address, state, zip] |> Enum.join(" ")

    case CivicApi.representatives(address) do
      {:ok, reps} ->
        render(conn, "results.html", address: address, reps: reps)

      {:error, _} ->
        put_flash(conn, :error, "Looks like you entered an invalid address")
        |> render("results.html", address: address, reps: [])
    end
  end
end
