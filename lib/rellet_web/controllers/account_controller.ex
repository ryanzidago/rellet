defmodule RelletWeb.AccountController do
  use RelletWeb, :controller

  alias Rellet.Accounts

  def index(conn, _params) do
    accounts = Accounts.list_accounts()
    json(conn, accounts)
  end

  def show(conn, %{"account_id" => account_id}) do
    account = Accounts.get_by_id(account_id)
    json(conn, account)
  end
end
