defmodule Todo.Resource.Root do
  use Mazurka.Resource

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "users" => link_to(Todo.Resource.Users)
      }
    end
  end
end