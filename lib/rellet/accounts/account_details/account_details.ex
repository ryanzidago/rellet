defmodule Rellet.Accounts.Account.Details do
  use Ecto.Schema

  alias Rellet.Accounts.Account
  alias Account.RoutingNumbers
  alias RelletWeb.Endpoint

  import Account.Details.Data

  @primary_key false
  @derive {Jason.Encoder, except: [:__meta__, :user_id]}
  schema "account_details" do
    field :user_id, :string
    field :account_id, :string
    field :account_number, :integer
    field :links, :map
    field :routing_numbers, :map
  end

  def get_by_account_id(account_id) do
    %Account.Details{
      account_id: account_id,
      account_number: build_account_number(),
      links: build_links(account_id),
      routing_numbers: RoutingNumbers.new()
    }
  end

  defp build_account_number do
    account_numbers()
    |> Enum.random()
    |> to_string()
  end

  defp build_links(account_id) do
    %{
      account: build_account_link(account_id),
      self: build_account_details_link(account_id)
    }
  end

  defp build_account_link(account_id) do
    RelletWeb.Router.Helpers.account_url(Endpoint, :show, account_id)
  end

  defp build_account_details_link(account_id) do
    RelletWeb.Router.Helpers.account_details_url(Endpoint, :show, account_id)
  end
end
