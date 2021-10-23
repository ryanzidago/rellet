defmodule RelletWeb.PageController do
  use RelletWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
