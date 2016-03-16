defmodule Todo.Resource.Items.Read do
  use Mediatype.Resource

  param item do
    Item.read(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "title" => item.title
      }
    end
  end
end