defmodule Todo.Resource.Root do
  use Mazurka.Resource

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "users" => link_to(Todo.Resource.Users)
      }
    end
  end

  test "should response with a 200" do
    conn = request do
      accept "hyper+json"
    end

    assert conn.status == 200
  end
end