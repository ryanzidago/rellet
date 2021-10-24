defmodule Rellet.Accounts.Account.BalancesTest do
  use ExUnit.Case

  alias Rellet.Accounts.Account

  describe "get_by_account_id/1" do
    test "gets an account's balances for an account_id" do
      account_id = "acc_l93c7g2ubk5a34pft1000"

      assert account_balances = Account.Balances.get_by_account_id(account_id)
      assert %Account.Balances{} = account_balances
      assert account_balances.account_id == account_id
      assert account_balances.available
      assert account_balances.ledger

      assert account_balances.links

      assert account_balances.links.self ==
               "http://localhost:4002/accounts/#{account_id}/balances"

      assert account_balances.links.account == "http://localhost:4002/accounts/#{account_id}"
    end
  end
end
