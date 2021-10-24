defmodule RelletWeb.AccountDetailsController do
  use RelletWeb, :controller

  alias Rellet.Accounts.Account

  def show(conn, %{"account_id" => account_id}) do
    account_details = Account.Details.get_by_account_id(account_id)
    json(conn, account_details)
  end
end
