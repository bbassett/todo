defmodule Todo.Service.List do
  use Todo.DB.Model
  alias Todo.DB.Postgres

  schema "todo_lists" do
    field :owner_id,      :integer
    field :title,         :string
    field :description,   :string
  end

  @create_inputs_required ~w(
    owner_id
    title
  )

  @create_inputs_optional ~w(
    description
  )

  def get_by_user(id) do
    query = from u in __MODULE__,
            where: u.owner_id == ^id,
            select: u
    {:ok, Postgres.all(query)}
  end
end