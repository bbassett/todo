defmodule Todo.Service.Item do
  use Ecto.Schema
  import Ecto.Query
  alias Todo.DB.Postgres

  schema "items" do
    field :list_id,       :integer
    field :title,         :string
    field :description,   :string
    field :due_date,      Ecto.Date
    field :complete,      :boolean
  end

  def get_by_list(id) do
    query = from u in __MODULE__,
            where: u.list_id == ^id,
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