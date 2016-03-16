defmodule Todo.Protocol.HTTP.Router do
  use Mazurka.Protocol.HTTP.Router
  use Mazurka.Mediatype.Hyperjson.Hyperpath
  use Todo.Dispatch

  plug :match
  if Mix.env == :dev do
    use Plug.Debugger
    plug Plug.Logger
  end
  plug :dispatch

  get     "/",                          Todo.Resource.Root
  get     "/users",                     Todo.Resource.Users
  get     "/users/:user",               Todo.Resource.Users.Read
  get     "/lists/:list",               Todo.Resource.Lists.Read
  get     "/items/:item",               Todo.Resource.Items.Read

  match   _,                            Todo.Resource.Error.NotFound
end