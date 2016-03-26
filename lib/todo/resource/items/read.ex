defmodule Todo.Resource.Users.Lists.Items.Read do
  use Mazurka.Resource

  param item do
    Item.read(value)
  end
  param user do
    User.read(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "title" => item.title,
        "description" => item.description,
        "due" => item.due_date,
        "complete" => item.complete,
        "list" => link_to(Todo.Resource.Users.Lists.Read, list: item.list_id, user: user)
      }
    end

    affordance do
      %{
        "title" => item.title
      }
    end
  end
end