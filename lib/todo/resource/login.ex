defmodule Todo.Resource.Login do
  use Mazurka.Resource

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "foo" => "bar"
      }
    end
  end

end