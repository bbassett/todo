defmodule Todo.Resource.Users.Lists do
  use Mazurka.Resource

  param user do
    value
  end
  let lists = List.get_by_user(user)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "collection" => for list <- lists do
          link_to(Todo.Resource.Users.Lists.Read, list: list)
        end,
        "create" => link_to(Todo.Resource.Users.Lists.Create)
      }
    end
  end

end