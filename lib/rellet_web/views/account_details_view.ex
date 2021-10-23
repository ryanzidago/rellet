defmodule RelletWeb.AccountDetailsView do
  use RelletWeb, :view

  def render("show.json", %{account_details: account_details}) do
    account_details
  end
end
