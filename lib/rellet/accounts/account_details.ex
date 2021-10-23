defmodule Rellet.Accounts.Account.Details do
  use Ecto.Schema

  @primary_key false
  @derive {Jason.Encoder, except: [:__meta__]}
  schema "account_details" do
    field :account_id, :string
    field :account_number, :integer
    field :links, :map
    field :routing_numbers, :map
  end
end
