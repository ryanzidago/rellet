defmodule Rellet.Accounts.Account.Transaction do
  use Ecto.Schema

  @primary_key {:id, :string, autogenerate: false}
  @derive {Jason.Encoder, except: [:__meta__]}

  schema "account_transactions" do
    field :account_id, :string
    field :amount, :float
    field :date, :date
    field :description, :string
    field :details, :map
    field :processing_status, :string
    field :links, :map
    field :running_balance, :float
    field :status, :string
    field :type, :string
  end
end
