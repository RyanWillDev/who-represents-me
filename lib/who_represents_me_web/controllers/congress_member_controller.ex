defmodule WRMWeb.CongressMemberController do
  use WRMWeb, :controller

  def details(conn, params) do
    with member <- WRM.Congress.get_member(params),
         true <- not is_nil(member) do
      render(conn, "details.html", member: member)
    end
  end
end
