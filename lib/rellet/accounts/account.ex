defmodule Rellet.Accounts.Account do
  use Ecto.Schema

  @primary_key {:id, :string, autogenerate: false}
  @derive {Jason.Encoder, except: [:__meta__]}
  schema "accounts" do
    field :currency, :string
    field :enrollment_id, :string
    field :institution, :map
    field :last_four, :integer
    field :links, :map
    field :name, :string
    field :subtype, :string
    field :type, :string
  end
end
