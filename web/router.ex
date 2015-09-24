defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :review_checks do
    plug :ensure_user_authenticated
    plug :user_own_reviews
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipe_through :browser

  get "/", HelloPhoenix.PageController, :index

  scope "/", HelloPhoenix do
    get "images", ImageController, :index

    resources "users", UserController do
      resources "posts", PostController
    end

    resources "comments", CommentController, except: [:delete] # only: [:index, :show]
    resources "reviews", ReviewController

    scope "reviews" do
      pipe_through :review_checks

      resources "reviews", ReviewController
    end
  end

  scope "/", AnotherApp do
    pipe_through :browser

    resources "posts", PostController
  end

  scope "admin", HelloPhoenix.Admin, as: :admin do
    pipe_through :browser

    resources "images",  ImageController
    resources "reviews", ReviewController
    resources "users",   UserController
  end

  scope "api", HelloPhoenix.Api, as: :api do
    pipe_through :api

    scope "v1", V1, as: :v1 do
      resources "images",  ImageController
      resources "reviews", ReviewController
      resources "users",   UserController
    end
  end
end
