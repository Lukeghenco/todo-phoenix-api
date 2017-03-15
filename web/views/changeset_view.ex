defmodule TodoApi.ChangesetView do
  use TodoApi.Web, :view

  def render("error.json", %{changeset: changeset}) do
    %{errors: changeset}
  end
end