defmodule BasicAuthExercise.Router do
  use BasicAuthExercise.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug BasicAuth, username: "user", password: "secret"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BasicAuthExercise do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", BasicAuthExercise do
  #   pipe_through :api
  # end
end
