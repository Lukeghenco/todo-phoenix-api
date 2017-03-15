defmodule TodoApi.Todo do 
    use TodoApi.Web, :model 

    schema "todos" do 
        field :title 
        field :description 

        timestamps()
    end 

    def changeset(struct, params \\ %{}) do 
        struct 
        |> cast(params, [:title, :description])
        |> validate_required([:title, :description])
        |> validate_length(:description, min: 10)
        |> validate_length(:description, max: 140)
    end
end