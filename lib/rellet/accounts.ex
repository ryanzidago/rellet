defmodule Rellet.Accounts do
  alias Rellet.Accounts.{Account}
  alias Rellet.Institutions.Institution

  def get_by_id(_id) do
    %Account{
      currency: "USD",
      enrollment_id: "enr_nmf3f7758gpc7b5cd6000",
      id: "acc_nmfff743stmo5n80t4000",
      institution: %Institution{
        id: "citibank",
        name: "Citibank"
      },
      last_four: "3836",
      links: %{
        balances: "https://api.teller.io/accounts/acc_nmfff743stmo5n80t4000/balances",
        details: "https://api.teller.io/accounts/acc_nmfff743stmo5n80t4000/details",
        self: "https://api.teller.io/accounts/acc_nmfff743stmo5n80t4000",
        transactions: "https://api.teller.io/accounts/acc_nmfff743stmo5n80t4000/transactions"
      },
      name: "My Checking",
      subtype: "checking",
      type: "depository"
    }
  end

  def list_accounts do
    [get_by_id(1)]
  end

  def get_account_details_by_account_id(_id) do
    %Account.Details{
      account_id: "acc_nmfff743stmo5n80t4000",
      account_number: "891824333836",
      links: %{
        account: "https://api.teller.io/accounts/acc_nmfff743stmo5n80t4000",
        self: "https://api.teller.io/accounts/acc_nmfff743stmo5n80t4000/details"
      },
      routing_numbers: %Account.RoutingNumbers{
        ach: "581559698"
      }
    }
  end

  def get_account_balances_by_account_id(_account_id) do
    %Account.Balances{
      account_id: "acc_nmfff743stmo5n80t4000",
      available: "33648.09",
      ledger: "33803.48",
      links: %{
        account: "https://api.teller.io/accounts/acc_nmfff743stmo5n80t4000",
        self: "https://api.teller.io/accounts/acc_nmfff743stmo5n80t4000/balances"
      }
    }
  end

  def get_account_transaction_by_account_id_and_transaction_id(_account_id, _transaction_id) do
    %Account.Transaction{
      account_id: "acc_nmfff743stmo5n80t4000",
      amount: "90.54",
      date: "2021-08-12",
      description: "In-N-Out Burger",
      details: %{
        category: "dining",
        counterparty: %{
          name: "IN N OUT BURGER",
          type: "organization"
        },
        processing_status: "complete"
      },
      id: "txn_nmfo2gtnstmo5n80t4004",
      links: %{
        account: "https://api.teller.io/accounts/acc_nmfff743stmo5n80t4000",
        self: "https://api.teller.io/accounts/acc_nmfff743stmo5n80t4000/transactions/"
      },
      running_balance: "33648.09",
      status: "posted",
      type: "ach"
    }
  end

  def get_account_transactions_by_account_id(account_id) do
    transaction = get_account_transaction_by_account_id_and_transaction_id(account_id, 1)
    [transaction]
  end
end
