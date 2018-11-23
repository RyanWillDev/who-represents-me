defmodule WRMWeb.SearchController do
  use WRMWeb, :controller

  def search(conn, %{"address" => address}) do
    case CivicApi.representatives(address) do
      {:ok, reps} ->
        require IEx
        IEx.pry()
        # reps = Enum.reverse(reps)
        render(conn, "results.html", address: address, reps: reps)

      {:error, _} ->
        put_flash(conn, :error, "Looks like you entered an invalid address")
        |> render("results.html", address: address, reps: [])
    end
  end
end
