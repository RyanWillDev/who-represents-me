defmodule WRMWeb.SearchController do
  use WRMWeb, :controller

  def search(conn, %{"address" => address}) do
    reps = CivicApi.representatives(address)
    render(conn, "results.html", address: address, reps: reps)
  end
end
