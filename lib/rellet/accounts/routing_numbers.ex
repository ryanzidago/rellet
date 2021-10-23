defmodule Rellet.Accounts.Account.RoutingNumbers do
  use Ecto.Schema

  @primary_key false
  @derive {Jason.Encoder, except: [:__meta__]}
  schema "account_routing_numbers" do
    field :ach, :integer
  end
end
