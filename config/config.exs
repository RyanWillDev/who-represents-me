# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :who_represents_me,
  namespace: WRM,
  ecto_repos: [WRM.Repo]

# Configures the endpoint
config :who_represents_me, WRMWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GCmOWxsULx4mJO57YSVOIovyy6HbenEjdIvjdbCjeD99XpTK6YIFqbjKjeEZwG+q",
  render_errors: [view: WRMWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WRM.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

import_config "civic_api.secret.exs"
import_config "congress_api.secret.exs"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
