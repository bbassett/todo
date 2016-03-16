defmodule Todo.DB.Model do
  defmacro __using__(_) do
    quote do
      use Mazurka.Model

      @before_compile unquote(__MODULE__)

      def create(params \\ %{}) do
        IO.inspect(params)
        res = __struct__()
        |> changeset(:create, params)
        |> Todo.DB.Postgres.insert!()
        {:ok, res}
      end

      def read(id) do
        query = from u in __MODULE__,
                where: u.id == ^id,
                select: u
        {:ok, Todo.DB.Postgres.one(query)}
      end
    end
  end

  defmacro __before_compile__(_) do
    quote do
      def changeset(model = %__MODULE__{}, :create, params) do
        model
        |> cast(params, @create_inputs_required, @create_inputs_optional)
      end
    end
  end
end