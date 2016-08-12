defmodule CoworkingSpace.UserController do
  use CoworkingSpace.Web, :controller

  alias CoworkingSpace.User
  plug Guardian.Plug.EnsureAuthenticated, handler: CoworkingSpace.AuthErrorHandler

  def current(conn, _) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(CoworkingSpace.UserView, "show.json", user: user)
  end
end