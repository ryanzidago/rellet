defmodule Rellet.Accounts.Account.Balances do
  use Ecto.Schema

  @primary_key false
  @derive {Jason.Encoder, except: [:__meta__]}
  schema "account_balances" do
    field :account_id, :string
    field :available, :float
    field :ledger, :float
    field :links, :map
  end
end
