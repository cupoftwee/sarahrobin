# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sarahrobin,
  ecto_repos: [Sarahrobin.Repo]

# Configures the endpoint
config :sarahrobin, SarahrobinWeb.Endpoint,
  url: [host: "localhost"],
  # secret_key_base: "vOWBDjSdXpFfmXDiMFOiv0uO6lmIfFEXLpCawWhkds1ahc6jXW3So3cDiLXimXKC",
  # secret_key_base: "6/sxMKB//wU5R7QSknNWbLrby8oyTkfKe+OtVivskdkFuda+Af2Kmv7bhXAfrflY",
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: SarahrobinWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Sarahrobin.PubSub, adapter: Phoenix.PubSub.PG2]

# Configure your database
config :sarahrobin, Sarahrobin.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  # The amount of database connections in the pool
  # keep < 20
  size: System.get_env("POOL_SIZE") 

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Guardian
config :sarahrobin, Sarahrobin.Auth.Guardian,
  issuer: "Sarahrobin",
  secret_key: "HNinpKh9NE3tr8BPJCpAEh0xzCqTIG3PWsfkR2AtzvUaRIpbs6oIQ9RcmjmGPekJ"

# Arc Image Upload
config :arc,
  storage: Arc.Storage.Local

