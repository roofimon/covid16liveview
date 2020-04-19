defmodule Covid66liveWeb.PageController do
  use Covid66liveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
