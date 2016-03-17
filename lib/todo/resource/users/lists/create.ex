defmodule Todo.Resource.Users.Lists.Create do
  use Mazurka.Resource

  let user_id = 4

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      list = List.create(%{
        "owner_id" => user_id,
        "title" => Input.get("title"),
        "description" => Input.get("description")
      })
      transition_to(Todo.Resource.Lists.Read, list: list)
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