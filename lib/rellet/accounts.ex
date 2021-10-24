defmodule Rellet.Accounts do
  alias Rellet.Accounts.Account

  def get_by_account_id(account_id) do
    Account.get_by_account_id(account_id)
  end

  def get_all do
    Account.get_all()
  end

  def get_account_details_by_account_id(account_id) do
    Account.Details.get_account_details_by_account_id(account_id)
  end

  def get_account_balances_by_account_id(account_id) do
    Account.Balances.get_by_account_id(account_id)
  end

  def get_account_transaction_by_account_id_and_transaction_id(account_id, transaction_id) do
    Account.Transaction.get_by_account_id_and_transaction_id(account_id, transaction_id)
  end

  def get_all_account_transactions_by_account_id(account_id) do
    Account.Transaction.get_all_by_account_id(account_id)
  end
end
