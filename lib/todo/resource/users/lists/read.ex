defmodule Todo.Resource.Users.Lists.Read do
  use Mazurka.Resource

  param list do
    List.read(value)
  end
  let items = Item.get_by_list(list.id)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "title" => list.title,
        "description" => list.description,
        "owner" => link_to(Todo.Resource.Users.Read, user: list.owner_id),
        "items" => for item <- items do
          link_to(Todo.Resource.Items.Read, item: item)
        end
      }
    end

    affordance do
      %{
        "title" => list.title
      }
    end
  end
end