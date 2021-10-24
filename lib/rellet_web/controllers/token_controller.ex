defmodule RelletWeb.TokenController do
  use RelletWeb, :controller

  alias RelletWeb.Endpoint

  @token_prefix "test_token_"

  def show(conn, _params) do
    json(conn, build_token())
  end

  defp build_token do
    user_id = Enum.random(1..9_999_999)
    token = Phoenix.Token.sign(Endpoint, "user auth", user_id)
    @token_prefix <> token
  end
end
