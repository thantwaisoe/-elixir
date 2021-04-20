defmodule DisscusWeb.PageController do
  use DisscusWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
