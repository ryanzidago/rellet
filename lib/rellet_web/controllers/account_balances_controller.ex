defmodule RelletWeb.AccountBalancesController do
  use RelletWeb, :controller

  alias Rellet.Accounts.Account

  def show(conn, %{"account_id" => account_id}) do
    account_balances = Account.Balances.get_by_account_id(account_id)
    json(conn, account_balances)
  end
end
