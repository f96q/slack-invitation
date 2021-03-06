defmodule SlackInvitation.Router do
  use SlackInvitation.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SlackInvitation do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/invitations", InvitationController, only: [:index, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", SlackInvitation do
  #   pipe_through :api
  # end
end
