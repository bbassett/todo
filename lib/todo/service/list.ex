defmodule Todo.Service.List do
  use Ecto.Schema
  import Ecto.Query
  alias Todo.DB.Postgres

  schema "todo_lists" do
    field :owner_id,      :integer
    field :title,         :string
    field :description,   :string
  end

  def get_by_user(id) do
    query = from u in __MODULE__,
            where: u.owner_id == ^id,
            select: u
    {:ok, Postgres.all(query)}
  end

  def read(id) do
    query = from u in __MODULE__,
            where: u.id == ^id,
            select: u
    {:ok, Postgres.one(query)}
  end
end