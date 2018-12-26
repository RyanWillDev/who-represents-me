defmodule WRMWeb.CongressMemberController do
  use WRMWeb, :controller
  action_fallback(WRMWeb.FallbackController)

  def details(conn, params) do
    with member <- WRM.Congress.get_member(params),
         true <- not is_nil(member) do
      render(conn, "details.html", member: member)
      # TODO (RW): Need to add an else case and handle the error here
    end
  end

  def member_details(conn, %{
        "propublica_id" => propublica_id,
        "chamber" => chamber,
        "term" => term
      }) do
    with {:ok, details} <- CongressApi.Members.details(propublica_id, chamber, term) do
      render(conn, "member_details.json", details: details)
    else
      error ->
        error
    end
  end
end
