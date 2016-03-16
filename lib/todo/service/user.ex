defmodule Todo.Service.User do
  use Todo.DB.Model
  alias Todo.DB.Postgres

  schema "users" do
    field :display_name
    field :full_name
    field :email
    field :phone
  end

  def get_users() do
    query = from u in __MODULE__,
            select: u
    {:ok, Postgres.all(query)}
  end

  def find_friends(id) do
    query = from u in __MODULE__,
            where: u.id != ^id,
            select: u
    {:ok, Postgres.all(query)}
  end
end

