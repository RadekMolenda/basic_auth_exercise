defmodule BasicAuthExercise.PageController do
  use BasicAuthExercise.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
