defmodule RelletWeb.AccountBalancesController do
  use RelletWeb, :controller

  alias Rellet.Accounts

  def show(conn, %{"account_id" => account_id}) do
    account_balances = Accounts.get_account_balances_by_account_id(account_id)
    json(conn, account_balances)
  end
end
