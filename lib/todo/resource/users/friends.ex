defmodule Todo.Resource.Users.Friends do
  use Mazurka.Resource

  param user do
    value
  end

  let friends = User.find_friends(user)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "collection" => for friend <- friends do
          link_to(Todo.Resource.Users.Read, user: friend)
        end
      }
    end
  end
end