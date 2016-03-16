defmodule Todo.Dispatch do
  use Mazurka.Dispatch
  alias Todo.Service

  service User, Service.User
  service List, Service.List
  service Item, Service.Item
end