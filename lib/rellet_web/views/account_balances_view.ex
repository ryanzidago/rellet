defmodule RelletWeb.AccountBalancesView do
  use RelletWeb, :view

  def render("show.json", %{account_balances: account_balances}) do
    account_balances
  end
end
