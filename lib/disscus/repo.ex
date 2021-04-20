defmodule Disscus.Repo do
  use Ecto.Repo,
    otp_app: :disscus,
    adapter: Ecto.Adapters.Postgres
end
