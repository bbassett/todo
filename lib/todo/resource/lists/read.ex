defmodule Todo.Resource.Lists.Read do
  use Mazurka.Resource

  param list do
    List.read(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "title" => list.title,
        "description" => list.description,
        "owner" => link_to(Todo.Resource.Users.Read, user: list.owner_id),
        "items" => "bunches"
      }
    end

    affordance do
      %{
        "title" => list.title
      }
    end
  end
end