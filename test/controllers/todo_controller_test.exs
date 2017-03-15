defmodule TodoApi.TodoControllerTest do 
    use TodoApi.ConnCase 
    import TodoApi.Factory
    alias TodoApi.TodoView

    test "#index renders a list of todos" do 
        conn = build_conn() 
        todo = insert(:todo)
        
        conn = get conn, todo_path(conn, :index)

        assert json_response(conn, 200) == render_json(TodoView, "index.json", todos: [todo])
    end 

    test "#show renders a single todo" do 
        conn = build_conn() 
        todo = insert(:todo) 

        conn = get conn, todo_path(conn, :show, todo)

        assert json_response(conn, 200) == render_json(TodoView, "show.json", todo: todo)
    end

    test "#create creates a new todo" do 
        conn = build_conn() 

        conn = post conn, todo_path(conn, :create, todo: %{
            title: "Something I need to do",
            description: "List of steps I need to complete"
        })

        assert json_response(conn, 201)["todo"]["title"] == "Something I need to do"
    end
end