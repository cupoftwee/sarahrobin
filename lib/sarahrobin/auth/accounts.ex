defmodule Sarahrobin.Auth.Accounts do
  alias Sarahrobin.Repo
  alias Sarahrobin.Auth.User
  alias Sarahrobin.Auth

  import Bcrypt
  import Ecto.Query
  import Plug.Conn

  def get_user(id), do: Repo.get(User, id)

  def get_current_user(conn) do
    Auth.Guardian.Plug.current_resource(conn)
  end

  def is_current_user_admin?(conn) do
    user = Auth.Guardian.Plug.current_resource(conn)
    case user do
      nil -> false
      user -> user.is_admin
    end
  end

  def authenticate_user(email, given_password) do
    query = Ecto.Query.from u in User, 
      where: u.email == ^email, 
      select: u
    IO.puts('email: ')
    IO.inspect(email)
    IO.puts('pw: ')
    IO.inspect(given_password)
    IO.puts('Query one results: ')
    IO.inspect(Repo.one(query))

    Repo.one(query)
    |> check_password(given_password)
  end

  def login(conn, user) do
    conn
    |> Auth.Guardian.Plug.sign_in(user)
    |> assign(:current_user, user)
  end

  def logout(conn) do
    conn
    |> Auth.Guardian.Plug.sign_out()
  end
  
  # Private

  # defp check_password(nil, _), do: {:error, "Incorrect email or password"}
  defp check_password(user, given_password) do
    IO.puts('user: ')
    IO.inspect(user)
    IO.inspect(user.password_hash)
    
    case Bcrypt.verify_pass(given_password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, user}
    end
  end

end