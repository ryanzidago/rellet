defmodule RelletWeb.PageController do
  use RelletWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def not_found(conn, _params) do
    conn
    |> put_status(:not_found)
    |> json(not_found_message())
  end

  defp not_found_message do
    %{
      error: %{
        code: "not_found",
        message: "The requested resource does not exist"
      }
    }
  end
end
