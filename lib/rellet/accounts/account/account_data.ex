defmodule Rellet.Accounts.Account.Data do
  def account_names do
    [
      "My Checking",
      "Jimmy Carter",
      "Ronald Reagan",
      "George H. W. Bush",
      "Bill Clinton",
      "George W. Bush",
      "Barack Obama",
      "Donald Trump"
    ]
  end

  def institutions do
    ["Chase", "Bank of America", "Wells Fargo", "Citibank", "Capital One"]
  end

  def last_fours, do: 1000..9999
end
