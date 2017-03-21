defmodule SlackInvitation.Invitation do
  use SlackInvitation.Web, :model

  def invite(email) do
    config = Application.get_env(:slack_invitation, SlackInvitation.Endpoint)
    team = config[:slack][:team]
    token = config[:slack][:api_token]
    form = [email: email, token: token, set_active: true]
    case HTTPoison.post("https://#{team}.slack.com/api/users.admin.invite", {:form, form}) do
      {:ok, response} ->
        body = response.body |> JSON.decode!
        case body do
          %{"ok" => true} -> {:ok, body}
          %{"ok" => false} -> {:error, %HTTPoison.Error{reason: body["error"]}}
        end
      {:error, error} ->  {:error, error}
    end
  end
end
