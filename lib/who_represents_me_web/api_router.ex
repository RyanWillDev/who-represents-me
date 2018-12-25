defmodule WRMWeb.ApiRouter do
  use WRMWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WRMWeb do
    pipe_through :api

    get("congress_members/:member_id/details", CongressMemberController, :member_details)
  end
end
