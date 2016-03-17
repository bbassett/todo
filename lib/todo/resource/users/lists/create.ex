defmodule Todo.Resource.Users.Lists.Create do
  use Mazurka.Resource

  param user do
    User.read(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      list = List.create(%{
        "owner_id" => user.id,
        "title" => Input.get("title"),
        "description" => Input.get("description")
      })
      transition_to(Todo.Resource.Users.Lists.Read, list: list, user: user)
    end

    affordance do
      %{
        "input" => %{
          "title" => %{
            "type" => "text",
            "required" => true
          },
          "description" => %{
            "type" => "text"
          }
        }
      }
    end
  end
end