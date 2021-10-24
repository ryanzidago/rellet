defmodule Rellet.Accounts.Account.RoutingNumbersTest do
  use ExUnit.Case

  alias Rellet.Accounts.Account

  describe "new/0" do
    test "creates a new RoutingNumbers whose `ach` filed is an integer between 1000_000_000 and 999_999_999" do
      assert routing_numbers = Account.RoutingNumbers.new()
      assert %Account.RoutingNumbers{} = routing_numbers

      assert String.to_integer(routing_numbers.ach) in 100_000_000..999_999_999
    end
  end
end
