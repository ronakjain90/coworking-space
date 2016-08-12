defmodule CoworkingSpace.AuthErrorHandler do
 use CoworkingSpace.Web, :controller

 def unauthenticated(conn, params) do
  conn
   |> put_status(401)
   |> render(CoworkingSpace.ErrorView, "401.json")
 end

 def unauthorized(conn, params) do
  conn
   |> put_status(403)
   |> render(CoworkingSpace.ErrorView, "403.json")
 end

end