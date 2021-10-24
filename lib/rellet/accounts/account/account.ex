defmodule Rellet.Accounts.Account do
  use Ecto.Schema

  alias Rellet.Institutions.Institution
  alias Rellet.Accounts.Account
  alias Rellet.RandIDGen
  alias RelletWeb.Endpoint

  import Account.Data

  @primary_key {:id, :string, autogenerate: false}
  @derive {Jason.Encoder, except: [:__meta__, :user_id]}

  schema "accounts" do
    field :user_id, :string
    field :currency, :string
    field :enrollment_id, :string
    field :institution, :map
    field :last_four, :integer
    field :links, :map
    field :name, :string
    field :subtype, :string
    field :type, :string
  end

  def get_all do
    account_ids = RandIDGen.gen_account_ids()
    build_accounts(account_ids)
  end

  def get_by_account_id(account_id) do
    Enum.find(get_all(), &(&1.id == account_id))
  end

  defp build_accounts(account_ids, accounts \\ [])
  defp build_accounts([], accounts), do: accounts

  defp build_accounts([account_id | account_ids], accounts) do
    account = build(account_id)
    build_accounts(account_ids, [account | accounts])
  end

  defp build(account_id) do
    enrollment_id = RandIDGen.gen_enrollment_id()

    %Account{
      currency: "USD",
      enrollment_id: enrollment_id,
      id: account_id,
      institution: Institution.new(),
      last_four: build_last_four(),
      links: build_links(account_id),
      name: build_account_name(),
      subtype: "checking",
      type: "depository"
    }
  end

  defp build_last_four do
    last_fours()
    |> Enum.random()
    |> to_string()
  end

  defp build_account_name do
    Enum.random(account_names())
  end

  defp build_links(account_id) do
    %{
      balances: balances_link(account_id),
      details: details_link(account_id),
      self: self_link(account_id),
      transactions: transactions_link(account_id)
    }
  end

  def self_link(account_id) do
    RelletWeb.Router.Helpers.account_url(Endpoint, :show, account_id)
  end

  defp balances_link(account_id) do
    RelletWeb.Router.Helpers.account_balances_url(Endpoint, :show, account_id)
  end

  defp details_link(account_id) do
    RelletWeb.Router.Helpers.account_details_url(Endpoint, :show, account_id)
  end

  defp transactions_link(account_id) do
    RelletWeb.Router.Helpers.account_transaction_url(Endpoint, :index, account_id)
  end
end
