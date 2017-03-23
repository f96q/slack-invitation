defmodule SlackInvitation.PageController do
  use SlackInvitation.Web, :controller

  def index(conn, _params) do
    conn
    |> redirect(to: invitation_path(conn, :index))
  end
end
