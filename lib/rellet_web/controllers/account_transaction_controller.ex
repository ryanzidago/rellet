defmodule RelletWeb.AccountTransactionController do
  use RelletWeb, :controller

  alias Rellet.Accounts.Account

  def index(conn, %{"account_id" => account_id}) do
    account_transactions = Account.Transaction.get_all_by_account_id(account_id)
    json(conn, account_transactions)
  end

  def show(conn, %{"account_id" => account_id, "transaction_id" => transaction_id}) do
    account_transaction =
      Account.Transaction.get_by_account_id_and_transaction_id(
        account_id,
        transaction_id
      )

    json(conn, account_transaction)
  end
end
