defmodule RelletWeb.Router do
  use RelletWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {RelletWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", RelletWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end

  scope "/accounts", RelletWeb do
    pipe_through :api

    get "/", AccountController, :index
    get "/:account_id", AccountController, :show
    get "/:account_id/details", AccountDetailsController, :show
    get "/:account_id/balances", AccountBalancesController, :show
    get "/:account_id/transactions", AccountTransactionController, :index
    get "/:account_id/transactions/:transaction_id", AccountTransactionController, :show
  end

  scope "/", RelletWeb do
    pipe_through :api

    get "/*path", PageController, :not_found
  end

  # Other scopes may use custom stacks.
  # scope "/api", RelletWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: RelletWeb.Telemetry
    end
  end
end
