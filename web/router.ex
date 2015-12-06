defmodule Unique.Router do
  use Unique.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Unique.Auth, repo: Unique.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Unique do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/posts", PostController
    resources "/users", UserController
    resources "/login", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Unique do
  #   pipe_through :api
  # end
end
