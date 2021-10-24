defmodule Rellet.Institutions.Institution do
  use Ecto.Schema

  import Rellet.Institutions.Institution.Data

  @primary_key {:id, :string, autogenerate: false}
  @derive {Jason.Encoder, except: [:__meta__]}
  schema "institutions" do
    field :name, :string
  end

  def new do
    name = Enum.random(institutions())
    id = to_snake_case(name)

    %__MODULE__{name: name, id: id}
  end

  defp to_snake_case(string) do
    string
    |> String.downcase()
    |> String.replace(" ", "_")
  end
end
