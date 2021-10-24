defmodule Rellet.Accounts.Account.Balances do
  use Ecto.Schema

  alias Rellet.Accounts.Account
  alias RelletWeb.Endpoint

  @primary_key false
  @derive {Jason.Encoder, except: [:__meta__]}
  schema "account_balances" do
    field :account_id, :string
    field :available, :float
    field :ledger, :float
    field :links, :map
  end

  def get_by_account_id(account_id), do: build(account_id)

  defp build(account_id) do
    %Account.Balances{
      account_id: account_id,
      available: "33648.09",
      ledger: "33803.48",
      links: build_links(account_id)
    }
  end

  defp build_links(account_id) do
    %{
      account: Account.self_link(account_id),
      self: self_link(account_id)
    }
  end

  def self_link(account_id) do
    RelletWeb.Router.Helpers.account_balances_url(Endpoint, :show, account_id)
  end
end
