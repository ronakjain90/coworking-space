defmodule CoworkingSpace.SessionController do
  use CoworkingSpace.Web, :controller

  def index(conn, _params) do
    # Return some static JSON for now
    conn
    |> json(%{status: "Ok ok"})
  end
end