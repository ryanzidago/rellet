defmodule Rellet.Repo do
  use Ecto.Repo,
    otp_app: :rellet,
    adapter: Ecto.Adapters.Postgres
end
