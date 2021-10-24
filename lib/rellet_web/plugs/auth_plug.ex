defmodule RelletWeb.AuthPlug do
  import Plug.Conn

  alias Rellet.RandIDGen

  @secret_key_base Application.compile_env!(:rellet, RelletWeb.Endpoint)[:secret_key_base]

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    with {:ok, conn} <- authenticate(conn),
         {:ok, conn} <- authorize(conn),
         {:ok, _} <- seed_from_user_id(conn.assigns.user_id) do
      conn
    else
      {:error, :invalid} ->
        conn
        |> Plug.BasicAuth.request_basic_auth()
        |> halt()

      _ ->
        conn
        |> put_status(:not_found)
        |> Phoenix.Controller.json(not_found_message())
        |> halt()
    end
  end

  defp authenticate(conn) do
    with {auth_token, ""} <- Plug.BasicAuth.parse_basic_auth(conn),
         {:ok, user_id} <- fetch_user_id_from_auth_token(auth_token),
         conn <- assign(conn, :user_id, user_id) do
      seed_from_user_id(conn.assigns.user_id)

      {:ok, conn}
    else
      error -> error
    end
  end

  defp authorize(conn) do
    {account_ids, transaction_ids} = gen_account_ids_and_transaction_ids(conn.assigns.user_id)

    with true <- maybe_check_if_account_belongs_to_user(conn, account_ids),
         true <- maybe_check_if_transaction_belongs_to_user_account(conn, transaction_ids) do
      {:ok, conn}
    else
      false ->
        {:error, :account_does_not_belong_to_user}
    end
  end

  defp fetch_user_id_from_auth_token("test_token_" <> auth_token) do
    Phoenix.Token.verify(@secret_key_base, "user auth", auth_token)
  end

  defp seed_from_user_id(user_id) do
    {:ok, :rand.seed(:exsplus, user_id)}
  end

  defp maybe_check_if_account_belongs_to_user(
         %{path_params: %{"account_id" => account_id}},
         account_ids
       ) do
    account_id in account_ids
  end

  defp maybe_check_if_account_belongs_to_user(_conn, _account_ids) do
    true
  end

  defp maybe_check_if_transaction_belongs_to_user_account(
         %{path_params: %{"transaction_id" => transaction_id}},
         transaction_ids
       ) do
    transaction_id in transaction_ids
  end

  defp maybe_check_if_transaction_belongs_to_user_account(_conn, _transaction_ids) do
    true
  end

  defp gen_account_ids_and_transaction_ids(user_id) do
    account_ids = RandIDGen.gen_account_ids()

    seed_from_user_id(user_id)

    transaction_ids = RandIDGen.gen_transaction_ids()

    {account_ids, transaction_ids}
  end

  defp not_found_message do
    %{
      error: %{
        code: "not_found",
        message: "The requested resource does not exist"
      }
    }
  end
end
