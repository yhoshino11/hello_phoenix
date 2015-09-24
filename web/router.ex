defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "json", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloPhoenix do
    pipe_through :browser

    get "/",          PageController, :index, as: :root
    get "/msg",       PageController, :msg
    get "/show/:msg", PageController, :show
    get "/plain",     PageController, :plain
    get "/params",    PageController, :params
    get "/error",     PageController, :error
    get "/redirect",  PageController, :to_root, as: :redirect_test
    get "/external",  PageController, :external
  end

  scope "/api", HelloPhoenix do
    pipe_through :api

    get "/show/:id", PageController, :api
    get "/success",  PageController, :success
  end
end
