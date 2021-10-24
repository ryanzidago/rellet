defmodule Rellet.RandIDGenTest do
  use ExUnit.Case

  alias Rellet.RandIDGen

  describe "gen_account_id/0" do
    test "generates a random account_id" do
      assert account_id = RandIDGen.gen_account_id()
      assert is_account_id(account_id)
    end
  end

  describe "gen_account_ids/0" do
    test "generates random account_ids" do
      assert account_ids = RandIDGen.gen_account_ids()
      Enum.each(account_ids, &is_account_id/1)
    end
  end

  describe "gen_transaction_id/0" do
    test "generates a random transaction_id" do
      assert transaction_id = RandIDGen.gen_transaction_id()
      assert is_transaction_id(transaction_id)
    end
  end

  describe "gen_transaction_ids/0" do
    test "generates random transaction_ids" do
      assert transaction_ids = RandIDGen.gen_transaction_ids()
      Enum.each(transaction_ids, &is_transaction_id/1)
    end
  end

  describe "gen_enrollment_id" do
    test "generates a random enrollment_id" do
      assert enrollment_id = RandIDGen.gen_enrollment_id()
      assert is_enrollment_id(enrollment_id)
    end
  end

  defp is_account_id(<<"acc_", _base_id::binary-size(18), "000">>), do: true
  defp is_account_id(_), do: false

  defp is_transaction_id(<<"txn_", _base_id::binary-size(18), "000">>), do: true
  defp is_transaction_id(_), do: false

  defp is_enrollment_id(<<"enr_", _base_id::binary-size(18), "000">>), do: true
  defp is_enrollment_id(_), do: false
end
