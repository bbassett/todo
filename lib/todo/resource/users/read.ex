defmodule Todo.Resource.Users.Read do
  use Mazurka.Resource

  param user do
    User.read(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "full_name" => user.full_name,
        "display_name" => user.display_name,
        "email" => user.email,
        "phone" => user.phone
      }
    end
  end

end