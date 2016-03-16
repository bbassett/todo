defmodule Todo.Resource.Items.Read do
  use Mazurka.Resource

  param item do
    Item.read(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "title" => item.title,
        "description" => item.description,
        "due" => item.due_date,
        "complete" => item.complete,
        "list" => link_to(Todo.Resource.Lists.Read, list: item.list_id)
      }
    end

    affordance do
      %{
        "title" => item.title
      }
    end
  end
end