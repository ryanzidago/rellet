defmodule Rellet.Accounts.Account.RoutingNumbers do
  use Ecto.Schema

  alias Rellet.Accounts.Account

  @achs 100_000_000..999_999_999

  @primary_key false
  @derive {Jason.Encoder, except: [:__meta__]}
  schema "account_routing_numbers" do
    field :ach, :integer
  end

  def new do
    %Account.RoutingNumbers{
      ach: build_ach()
    }
  end

  defp build_ach do
    @achs
    |> Enum.random()
    |> to_string()
  end
end
