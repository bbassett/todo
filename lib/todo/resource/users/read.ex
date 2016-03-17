defmodule Todo.Resource.Users.Read do
  use Mazurka.Resource

  param user do
    User.read(value)
  end

  let lists = List.get_by_user(user.id)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "full_name" => user.full_name,
        "display_name" => user.display_name,
        "email" => user.email,
        "phone" => user.phone,
        "friends" => link_to(Todo.Resource.Users.Friends, user: user),
        "lists" => link_to(Todo.Resource.Users.Lists, user: user)
      }
    end

    affordance do
      %{
        "name" => user.display_name
      }
    end
  end

end