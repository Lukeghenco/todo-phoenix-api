defmodule TodoApi.Factory do 
    use ExMachina.Ecto, repo: TodoApi.Repo 

    def todo_factory do 
        %TodoApi.Todo{
            title: "Something I need to do",
            description: "List of steps I need to complete",
        }
    end 
end