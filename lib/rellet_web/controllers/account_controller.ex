defmodule RelletWeb.AccountController do
  use RelletWeb, :controller

  alias Rellet.Accounts.Account

  def index(conn, _params) do
    accounts = Account.get_all()
    json(conn, accounts)
  end

  def show(conn, %{"account_id" => account_id}) do
    account = Account.get_by_id(account_id)
    json(conn, account)
  end
end
