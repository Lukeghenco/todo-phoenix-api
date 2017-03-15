defmodule TodoApi.Router do
  use TodoApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodoApi do
    pipe_through :api

    resources "/todos", TodoController, only: [:index, :show, :create]
  end
end
