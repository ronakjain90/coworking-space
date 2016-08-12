defmodule CoworkingSpace.Router do
  use CoworkingSpace.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", CoworkingSpace do
    pipe_through :api
    resources "session", SessionController, only: [:index]
  end
end
