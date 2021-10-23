defmodule RelletWeb.AccountTransactionView do
  use RelletWeb, :view

  def render("index.json", %{account_transactions: account_transactions}) do
    account_transactions
  end

  def render("show.json", %{account_transaction: account_transaction}) do
    account_transaction
  end
end
