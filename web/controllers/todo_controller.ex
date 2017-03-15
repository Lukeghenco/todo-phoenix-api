defmodule TodoApi.TodoController do
  use TodoApi.Web, :controller

  alias TodoApi.Todo

  plug :scrub_params, "todo" when action in [:create, :update]

  def index(conn, _params) do
    todos = Repo.all(Todo)
    render(conn, "index.json", todos: todos)
  end

  def create(conn, %{"todo" => todo_params}) do 
    changeset = Todo.changeset(%Todo{}, todo_params)

    case Repo.insert(changeset) do 
      {:ok, todo} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", todo_path(conn, :show, todo))
        |> render("show.json", todo: todo)
      {:error, changeset} ->
        conn 
        |> put_status(:unprocessable_entity)
        |> render(TodoApi.ChangesetView, "error.json", changeset)
    end
  end

  def show(conn, %{"id" => id}) do 
    todo = Repo.get!(Todo, id) 
    render(conn, "show.json", todo: todo)
  end
end