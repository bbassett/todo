defmodule Todo.Resource.Users.Lists.Read do
  use Mazurka.Resource

  param user do
    User.read(user)
  end

  param list do
    List.read(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "title" => list.title,
        "description" => list.description,
        "owner" => link_to(Todo.Resource.Users.Read, user: user),
        "items" => link_to(Todo.Resource.Users.Lists.Items, user: user, list: list)
      }
    end

    affordance do
      %{
        "title" => list.title
      }
    end
  end
end