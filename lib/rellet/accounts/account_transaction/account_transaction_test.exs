defmodule Rellet.Accounts.Account.TransactionTest do
  use ExUnit.Case

  alias Rellet.Accounts.Account

  setup do
    [account | _] = Account.get_all()
    [transaction | _] = transactions = Account.Transaction.get_all_by_account_id(account.id)

    {
      :ok,
      account: account, transaction: transaction, transactions: transactions
    }
  end

  test "a transaction has the correct attributes", %{account: account, transaction: transaction} do
    assert transaction.account_id == account.id
    assert transaction.amount
    assert Date.compare(transaction.date, Date.utc_today()) != :gt
  end

  describe "get_by_account_id_and_transaction_id/2" do
    # TODO: fix test
    # test "returns a transaction for an account_id and a transaction_id", %{
    #   account: account,
    #   transaction: transaction
    # } do
    #   assert ^transaction =
    #            Account.Transaction.get_by_account_id_and_transaction_id(
    #              account.id,
    #              transaction.id
    #            )

    #   assert %Account.Transaction{} == transaction
    # end
  end

  describe "get_all_by_account_id/1" do
    test "gets all transactions from the last 90 days for a given account_id", %{account: account} do
      assert transactions = Account.Transaction.get_all_by_account_id(account.id)
      assert [%Account.Transaction{} | _] = transactions
      assert length(transactions)

      for n <- 1..90 do
        assert transaction = Enum.at(transactions, n - 1)
        assert Date.compare(transaction.date, Date.add(Date.utc_today(), -n)) != :gt
      end
    end
  end
end
