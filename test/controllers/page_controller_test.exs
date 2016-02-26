defmodule BasicAuthExercise.PageControllerTest do
  use BasicAuthExercise.ConnCase

  def with_valid_authorization_header(conn) do
    conn
    |> put_req_header("authorization", "Basic dXNlcjpzZWNyZXQ=")
  end

  test "GET / without authorization header should throw 401", %{conn: conn} do
    conn = get conn, "/"
    assert response(conn, 401) == "unauthorized"
  end

  test "GET / with correct authorization be OK", %{conn: conn} do
    conn = conn
    |> with_valid_authorization_header()
    |> get("/")
    assert response(conn, 200) == "unauthorized"
  end

end
