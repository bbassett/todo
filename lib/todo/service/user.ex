defmodule Todo.Service.User do
  use Ecto.Schema
  import Ecto.Query
  alias Todo.DB.Postgres

  schema "users" do
    field :display_name
    field :full_name
    field :email
    field :phone
  end

  def read(id) do
    query = from u in __MODULE__,
            where: u.id == ^id,
            select: u
    {:ok, Postgres.one(query)}
  end

  def get_users() do
    query = from u in __MODULE__,
            select: u
    {:ok, Postgres.all(query)}
  end
end

