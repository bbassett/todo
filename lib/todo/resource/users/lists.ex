defmodule Todo.Resource.Users.Lists do
  use Mazurka.Resource
  alias Todo.Resource.Users.Lists

  param user do
    User.read(value)
  end
  let lists = List.get_by_user(user.id)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "collection" => for list <- lists do
          link_to(Lists.Read, list: list)
        end,
        "create" => link_to(Lists.Create)
      }
    end
  end

end