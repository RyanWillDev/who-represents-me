defmodule WRMWeb.Router do
  use WRMWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  forward "/api", WRMWeb.ApiRouter

  scope "/", WRMWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/reps", SearchController, :search

    get "/congress_member", CongressMemberController, :details
  end

  # Other scopes may use custom stacks.
  # scope "/api", WRMWeb do
  #   pipe_through :api
  # end
end
