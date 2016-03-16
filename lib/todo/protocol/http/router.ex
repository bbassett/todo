defmodule Todo.Protocol.HTTP.Router do
  use Mazurka.Protocol.HTTP.Router
  use Mazurka.Mediatype.Hyperjson.Hyperpath
  use Todo.Dispatch, [
    link_transform: :link_transform
  ]

  plug :match
  if Mix.env == :dev do
    use Plug.Debugger
    plug Plug.Logger
  end
  plug Plug.Parsers, parsers: [Plug.Parsers.JSON,
                               Plug.Parsers.URLENCODED],
                     json_decoder: Poison
  plug :dispatch


  get     "/",                          Todo.Resource.Root
  get     "/users",                     Todo.Resource.Users
  get     "/users/:user",               Todo.Resource.Users.Read
  get     "/lists/:list",               Todo.Resource.Lists.Read
  post    "/lists",                     Todo.Resource.Lists.Create
  get     "/items/:item",               Todo.Resource.Items.Read

  match   _,                            Todo.Resource.Error.NotFound

  def link_transform(link, _conn) do
    link
  end
end