defmodule Todo.Supervisor do
  use Supervisor
  import Supervisor.Spec

  def start_link() do
    {:ok, _sup} = Supervisor.start_link(__MODULE__, [], name: :supervisor)
  end

  def init(_) do
    processes = [
      worker(Todo.DB.Postgres, [])
    ]
    {:ok, { {:one_for_one, 10, 10}, processes} }
  end
end