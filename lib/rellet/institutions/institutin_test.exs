defmodule Rellet.Institutions.InstitutionTest do
  use ExUnit.Case

  alias Rellet.Institutions.Institution

  describe "new/0" do
    test "creates randomly a new institution" do
      assert institution = Institution.new()
      assert %Institution{} = institution
      assert institution.name in Institution.Data.institutions()
      assert String.replace(institution.id, "_", " ") == String.downcase(institution.name)
    end
  end
end
