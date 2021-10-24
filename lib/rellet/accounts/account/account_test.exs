defmodule Rellet.Accounts.AccountTest do
  use ExUnit.Case

  alias Rellet.Accounts.Account
  alias Rellet.Institutions.Institution

  setup do
    user_id = 1
    :rand.seed(:exsplus, user_id)

    assert [account | _] = accounts = Account.get_all()
    :rand.seed(:exsplus, user_id)

    {
      :ok,
      accounts: accounts, account: account
    }
  end

  test "an account has the correct attributes", %{account: account} do
    assert account.currency == "USD"
    assert account.enrollment_id =~ "enr_"
    assert account.id =~ "acc_"

    assert %Institution{} = account.institution
    assert account.institution.name in Account.Data.institutions()
    assert account.institution.id

    assert account.last_four
    assert String.to_integer(account.last_four) in Account.Data.last_fours()

    assert account.links.self =~ "http://localhost"
    assert account.links.self =~ account.id
    assert account.links.balances =~ "/balances"
    assert account.links.transactions =~ "/transactions"

    assert account.name in Account.Data.account_names()
    assert account.subtype == "checking"
    assert account.type == "depository"
  end

  describe "get_by_account_id/1" do
    test "returns the account for the current user_id seed", %{account: account} do
      assert %Account{} = ^account = Account.get_by_account_id(account.id)
    end
  end

  describe "get_all/0" do
    test "returns all account for the given user_id seed" do
      user_id_1 = 1
      :rand.seed(:exsplus, user_id_1)

      accounts_from_user_1 = Account.get_all()
      assert [%Account{} | _] = accounts_from_user_1
      assert length(accounts_from_user_1) > 0
    end

    test "returns different account based on the user_id seed" do
      user_id_1 = 1
      :rand.seed(:exsplus, user_id_1)

      accounts_from_user_1 = Account.get_all()
      assert [%Account{} | _] = accounts_from_user_1
      assert length(accounts_from_user_1) > 0

      user_id_2 = 2
      :rand.seed(:exsplus, user_id_2)

      accounts_from_user_2 = Account.get_all()
      assert [%Account{} | _] = accounts_from_user_2
      assert length(accounts_from_user_2) > 0

      Enum.each(accounts_from_user_1, fn account_from_user_1 ->
        assert account_from_user_1 not in accounts_from_user_2
      end)
    end
  end
end
