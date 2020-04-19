defmodule Covid66live.Repo do
  use Ecto.Repo,
    otp_app: :covid66live,
    adapter: Ecto.Adapters.Postgres
end
