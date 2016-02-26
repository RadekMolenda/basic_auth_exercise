defmodule BasicAuthExercise.PageControllerTest do
  use BasicAuthExercise.ConnCase

  test "GET / without authorization header should throw 401", %{conn: conn} do
    conn = get conn, "/"
    assert response(conn, 401) == "unauthorized"
  end
end
