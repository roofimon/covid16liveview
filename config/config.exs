# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :covid66live,
  ecto_repos: [Covid66live.Repo]

# Configures the endpoint
config :covid66live, Covid66liveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qRT2sYOD+PimI5383EgVYLqPwDFBEQJ+hL7QIVrvmYP38YosScwFJEDHHnqiYXaf",
  render_errors: [view: Covid66liveWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Covid66live.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "nhoLCZjbkynL5SGCt+wQFODhcIBkum1Y"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
