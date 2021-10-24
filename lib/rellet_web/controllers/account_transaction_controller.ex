defmodule RelletWeb.AccountTransactionController do
  use RelletWeb, :controller

  alias Rellet.Accounts

  def index(conn, %{"account_id" => account_id}) do
    account_transactions = Accounts.get_all_account_transactions_by_account_id(account_id)
    ids = account_transactions |> Enum.map(& &1.id)
    json(conn, account_transactions)
  end

  def show(conn, %{"account_id" => account_id, "transaction_id" => transaction_id}) do
    account_transaction =
      Accounts.get_account_transaction_by_account_id_and_transaction_id(
        account_id,
        transaction_id
      )

    json(conn, account_transaction)
  end
end
