defmodule Rellet.Accounts.Account.Balances do
  use Ecto.Schema

  alias Rellet.Accounts.Account
  alias RelletWeb.Endpoint

  @primary_key false
  @derive {Jason.Encoder, except: [:__meta__]}
  schema "account_balances" do
    field :account_id, :string
    field :available, :integer
    field :ledger, :integer
    field :links, :map
  end

  def get_by_account_id(account_id), do: build(account_id)

  defp build(account_id) do
    last_transaction = Account.Transaction.get_last_by_account_id(account_id)
    do_build(account_id, last_transaction)
  end

  defp do_build(account_id, last_transaction) do
    %Account.Balances{
      account_id: account_id,
      available: last_transaction.running_balance,
      ledger: last_transaction.running_balance,
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
