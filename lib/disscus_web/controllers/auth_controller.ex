defmodule DisscusWeb.AuthController do
  use DisscusWeb, :controller
  plug Ueberauth

  require Logger
  alias Disscus.User
  alias Disscus.Repo

  def test_logger() do
    user_name = "thant"
    Logger.info("hey is me #{user_name}")
    Logger.metadata(request_id: "123")
    Logger.debug("hey is me #{user_name}")
    Logger.error("hey is me #{user_name}")
    Logger.warn("hey is me #{user_name}")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_param = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}
    changeset = User.changeset(%User{}, user_param)

    singin(conn, changeset)
  end

  defp singin(conn, changeset) do
    case insert_or_update(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back")
        |> Plug.Conn.put_session(:user_id, user.id)
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, _} ->
        conn
        |> put_flash(:error, "Cannot Singin ")
        |> redirect(to: Routes.topic_path(conn, :index))
    end
  end

  defp insert_or_update(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)

      user ->
        {:ok, user}
    end
  end
end
