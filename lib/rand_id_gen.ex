defmodule Rellet.RandIDGen do
  @account_id_prefix "acc_"
  @transaction_id_prefix "txn_"
  @enrollment_id_prefix "enr_"
  @right_padding "000"
  @length 18
  @alphanum Enum.to_list(?a..?z) ++ Enum.to_list(?0..?9)

  def gen_account_id do
    base_id = do_gen()
    @account_id_prefix <> base_id <> @right_padding
  end

  def gen_account_ids do
    for _ <- 1..Enum.random([1, 1, 1, 1, 2, 2, 3]) do
      gen_account_id()
    end
  end

  def gen_transaction_id do
    base_id = do_gen()
    @transaction_id_prefix <> base_id <> @right_padding
  end

  def gen_transaction_ids do
    for _ <- 1..90 do
      Rellet.RandIDGen.gen_transaction_id()
    end
  end

  def gen_enrollment_id do
    base_id = do_gen()
    @enrollment_id_prefix <> base_id <> @right_padding
  end

  defp do_gen, do: for(_ <- 1..@length, into: "", do: <<Enum.random(@alphanum)>>)
end
