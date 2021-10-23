defmodule RelletWeb.AccountView do
  use RelletWeb, :view

  def render("index.json", %{accounts: accounts}) do
    accounts
  end

  def render("show.json", %{account: account}) do
    account
  end
end
