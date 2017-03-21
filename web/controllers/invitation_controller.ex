defmodule SlackInvitation.InvitationController do
  use SlackInvitation.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, _params) do
    email = _params["invitation"]["email"]
    case SlackInvitation.Invitation.invite(email) do
      {:ok, body} ->
        conn
        |> put_flash(:info, "success")
        |> redirect(to: invitation_path(conn, :index))
      {:error, error} ->
        conn
        |> put_flash(:error, error.reason)
        |> render("index.html")
    end
  end
end
