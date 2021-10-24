defmodule Rellet.Accounts.Account.Transaction do
  use Ecto.Schema

  alias Rellet.Accounts.Account
  alias RelletWeb.Endpoint

  alias Rellet.RandIDGen

  import Account.Transaction.Data

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

  def get_by_account_id_and_transaction_id(account_id, transaction_id) do
    account_id
    |> get_all_by_account_id()
    |> Enum.find(&(&1.id == transaction_id))
  end

  def get_all_by_account_id(account_id) do
    transaction_ids = RandIDGen.gen_transaction_ids()
    do_build_from_n_days_ago(account_id, transaction_ids)
  end

  defp do_build_from_n_days_ago(
         account_id,
         transaction_ids,
         running_balance \\ 1_000_000,
         transactions \\ [],
         n_days_ago \\ 90
       )

  defp do_build_from_n_days_ago(
         account_id,
         [transaction_id],
         running_balance,
         transactions,
         n_days_ago = 0
       ) do
    {transaction, _} = build(account_id, transaction_id, running_balance, n_days_ago)
    [transaction | transactions]
  end

  defp do_build_from_n_days_ago(
         account_id,
         [transaction_id | transaction_ids],
         running_balance,
         transactions,
         n_days_ago
       ) do
    {transaction, running_balance} =
      build(account_id, transaction_id, running_balance, n_days_ago)

    do_build_from_n_days_ago(
      account_id,
      transaction_ids,
      running_balance,
      [transaction | transactions],
      n_days_ago - 1
    )
  end

  defp build(account_id, transaction_id, running_balance, n_days_ago) do
    amount = build_amount()
    running_balance = running_balance + amount
    description = build_description()

    transaction = %Account.Transaction{
      account_id: account_id,
      amount: amount,
      date: build_date(n_days_ago),
      description: description,
      details: build_details(description),
      id: transaction_id,
      links: build_links(account_id, transaction_id),
      running_balance: running_balance,
      status: "posted",
      type: "card_payment"
    }

    {transaction, running_balance}
  end

  defp build_description do
    Enum.random(merchants())
  end

  defp build_details(name) do
    category = Enum.random(merchant_categories())

    %{
      category: category,
      counterpary: %{
        name: name,
        type: "organization"
      },
      processing_status: "complete"
    }
  end

  defp build_links(account_id, transaction_id) do
    %{
      account: Account.self_link(account_id),
      self: self_link(account_id, transaction_id)
    }
  end

  def self_link(account_id, transaction_id) do
    RelletWeb.Router.Helpers.account_transaction_url(Endpoint, :show, account_id, transaction_id)
  end

  defp build_date(n_days_ago) do
    Date.add(Date.utc_today(), -n_days_ago)
  end

  defp build_amount do
    Enum.random(-10..-150)
  end
end
