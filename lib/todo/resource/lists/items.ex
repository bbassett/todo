defmodule Todo.Resource.Users.Lists.Items do
  use Mazurka.Resource

  param list do
    List.read(list)
  end
  param user do
    User.read(user)
  end
  let items = Item.get_by_list(list.id)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "collection" => for item <- items do
          link_to(Todo.Resource.Users.Lists.Items.Read, user: user, list: list, item: item)
        end
      }
    end
  end
end