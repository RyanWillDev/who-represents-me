defmodule WRMWeb.SearchController do
  use WRMWeb, :controller

  def search(conn, %{"address" => address}) do
    render(conn, "results.html", address: address)
  end
end
