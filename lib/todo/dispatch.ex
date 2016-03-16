defmodule Todo.Dispatch do
  use Mazurka.Dispatch
  alias Todo.Service

  service Greeting.world/0, Service.Greeting.world
end