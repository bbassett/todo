defmodule Todo.Resource.Users.Read do
  use Mazurka.Resource

  param user do
    User.read(value)
  end

  let friends = User.find_friends(user.id)
  let lists = List.get_by_user(user.id)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "full_name" => user.full_name,
        "display_name" => user.display_name,
        "email" => user.email,
        "phone" => user.phone,
        "friends" => for friend <- friends do
          link_to(Todo.Resource.Users.Read, user: friend)
        end,
        "todo_lists" => %{
          "collection" => for list <- lists do
            link_to(Todo.Resource.Lists.Read, list: list)
          end,
          "create" => link_to(Todo.Resource.Lists.Create)
        }
      }
    end

    affordance do
      %{
        "name" => user.display_name
      }
    end
  end

end