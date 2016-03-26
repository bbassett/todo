defmodule Todo.Resource.Users.Lists.Items.Create do
  use Mazurka.Resource

  param item do
    Item.read(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "foo" => "bar"
      }
    end

    affordance do
      %{
        "create" => item.title
      }
    end
  end
end