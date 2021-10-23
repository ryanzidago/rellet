defmodule RelletWeb.AuthPlug do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, opts) do
    auth(conn, opts)
  end

  defp auth(conn, _opts) do
    with {auth_token, ""} <- Plug.BasicAuth.parse_basic_auth(conn),
         true <- auth_token_valid?(auth_token) do
      conn
    else
      _ ->
        conn
        |> Plug.BasicAuth.request_basic_auth()
        |> halt()
    end
  end

  defp auth_token_valid?(auth_token) do
    auth_token
    |> String.starts_with?("test_token_")
  end

  # defp unauthorized_error_message do
  #   %{
  #     error: %{
  #       code: "forbidden",
  #       message: "Authorization token invalid"
  #     }
  #   }
  # end
end
