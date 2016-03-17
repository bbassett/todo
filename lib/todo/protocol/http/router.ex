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


  get     "/",                                    Todo.Resource.Root
  get     "/users",                               Todo.Resource.Users
  post    "/users",                               Todo.Resource.Users.Create
  get     "/users/:user",                         Todo.Resource.Users.Read
  get     "/users/:user/friends",                 Todo.Resource.Users.Friends
  get     "/users/:user/lists",                   Todo.Resource.Users.Lists
  post    "/users/:user/lists",                   Todo.Resource.Users.Lists.Create
  get     "/users/:user/lists/:list",             Todo.Resource.Users.Lists.Read
  get     "/users/:user/lists/:list/items",       Todo.Resource.Users.Lists.Items
  post    "/users/:user/lists/:list/items",       Todo.Resource.Users.Lists.Items.Create
  get     "/users/:user/lists/:list/items/:item", Todo.Resource.Users.Lists.Items.Read

  match   _,                            Todo.Resource.Error.NotFound

  def link_transform(link, _conn) do
    link
  end
end