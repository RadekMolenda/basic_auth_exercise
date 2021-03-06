defmodule BasicAuth do
  import Plug.Conn

  @realm "Basic realm=\"Thou Shalt not pass\""

  def init(opts) do
    Keyword.fetch!(opts, :username)
    Keyword.fetch!(opts, :password)
    opts
  end

  def call(conn, [username: username, password: password]) do
    case get_req_header(conn, "authorization") do
      ["Basic " <> auth] ->
        if auth == encode(username, password) do
          conn
        else
          unauthorized(conn)
        end
      _ ->
        unauthorized(conn)
    end
  end

  defp encode(username, password), do: Base.encode64(username <> ":" <> password)

  defp unauthorized(conn) do
    conn
    |> put_resp_header("www-authenticate", @realm)
    |> send_resp(401, "unauthorized")
    |> halt()
  end
end
