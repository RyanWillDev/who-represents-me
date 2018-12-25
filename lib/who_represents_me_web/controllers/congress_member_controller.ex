defmodule WRMWeb.CongressMemberController do
  use WRMWeb, :controller
  action_fallback(WRMWeb.FallbackController)

  def details(conn, params) do
    with member <- WRM.Congress.get_member(params),
         true <- not is_nil(member) do
      # require IEx
      # IEx.pry()
      render(conn, "details.html", member: member)
      # TODO (RW): Need to add an else case and handle the error here
    end
  end

  def member_details(conn, %{"member_id" => memeber_id}) do
    with {:ok, details} <- CongressApi.Members.details(memeber_id) do
      render(conn, "member_details.json", details: details)
    else
      error ->
        require IEx
        IEx.pry()
        error
    end
  end
end
