defmodule RelletWeb.AccountDetailsController do
  use RelletWeb, :controller

  alias Rellet.Accounts

  def show(conn, %{"account_id" => account_id}) do
    account_detail = Accounts.get_account_details_by_account_id(account_id)
    json(conn, account_detail)
  end
end
