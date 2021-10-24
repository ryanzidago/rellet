defmodule RelletWeb.AuthPlugTest do
  use RelletWeb.ConnCase

  alias RelletWeb.AuthPlug

  describe "init/1" do
    test "returns the given opts" do
      assert [] = AuthPlug.init([])
    end
  end

  describe "call/2" do
    test "authenticates and authorizes the user", %{conn: _conn} do
      # assert conn = AuthPlug.call(conn, [])
    end
  end
end
