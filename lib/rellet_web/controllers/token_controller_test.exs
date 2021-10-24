defmodule RelletWeb.TokenControllerTest do
  use RelletWeb.ConnCase

  describe "show/0" do
    test "returns a new token", %{conn: conn} do
      conn = get(conn, Routes.token_path(conn, :show))
      assert json_response(conn, 200) =~ "test_token_"
    end
  end
end
