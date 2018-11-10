defmodule WRM.Repo do
  use Ecto.Repo,
    otp_app: :who_represents_me,
    adapter: Ecto.Adapters.Postgres
end
