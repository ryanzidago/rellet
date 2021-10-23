defmodule Rellet.Institutions.Institution do
  use Ecto.Schema

  @primary_key {:id, :string, autogenerate: false}
  @derive {Jason.Encoder, except: [:__meta__]}
  schema "institutions" do
    field :name, :string
  end
end
