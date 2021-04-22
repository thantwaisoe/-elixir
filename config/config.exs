# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :disscus,
  ecto_repos: [Disscus.Repo]

# Configures the endpoint
config :disscus, DisscusWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MCt0koDcqtKRql9nUZcSXxjVQ6qWVuh6c4qs4fBvnhx2wPTG1oO+H59TPLOwoY8T",
  render_errors: [view: DisscusWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Disscus.PubSub,
  live_view: [signing_salt: "ryZqFXOz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :logger,
  backends: [:console],
  format: {Logger.MyLogger, :format},
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, []}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "28eda3bb1b5b4e97a9b3",
  client_secret: "de7384a42a9bd85b57507eb9b10ce8fa94e418e1"
