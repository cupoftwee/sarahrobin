defmodule Sarahrobin.Repo do
  use Ecto.Repo,
    otp_app: :sarahrobin,
    adapter: Ecto.Adapters.Postgres
end
