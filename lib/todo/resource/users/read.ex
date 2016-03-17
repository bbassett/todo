defmodule Todo.Resource.Users.Read do
  use Mazurka.Resource
  alias Todo.Resource.Users

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
        "friends" => link_to(Users.Friends, user: user),
        "lists" => link_to(Users.Lists, user: user)
      }
    end

    affordance do
      %{
        "name" => user.display_name
      }
    end
  end

end