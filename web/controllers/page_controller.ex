defmodule SlackInvitation.PageController do
  use SlackInvitation.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
