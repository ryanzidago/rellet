defmodule Rellet.Accounts.Account.DetailsTest do
  use ExUnit.Case

  alias Rellet.Accounts.Account

  describe "get_by_account_id/1" do
    test "returns an account_details for an account_id" do
      assert account_details = Account.Details.get_by_account_id("acc_l93c7g2ubk5a34pft1000")

      assert %Account.Details{} = account_details
      assert account_details.account_id == "acc_l93c7g2ubk5a34pft1000"

      assert account_details.account_number

      assert String.to_integer(account_details.account_number) in Account.Details.Data.account_numbers()

      assert account_details.links

      assert account_details.links.self =~
               "http://localhost:4002/accounts/acc_l93c7g2ubk5a34pft1000/details"

      assert account_details.links.account =~
               "http://localhost:4002/accounts/acc_l93c7g2ubk5a34pft1000"

      assert %Account.RoutingNumbers{} = account_details.routing_numbers
      assert account_details.routing_numbers.ach
    end
  end
end
