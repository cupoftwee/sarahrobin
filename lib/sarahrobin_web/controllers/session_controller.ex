defmodule SarahrobinWeb.SessionController do
  use SarahrobinWeb, :controller
  require Logger

  alias Sarahrobin.Auth.Accounts


  # not yet implemented
  # def index(conn, _) do
  #   render("new.html")
  # end

  def new(conn, _) do
    conn 
      |> render("new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        conn
        |> Accounts.login(user)
        |> redirect_after_login(user)
  
      {:error, _} ->
        Logger.warn('err on auth user', :error)

        conn
        |> put_flash(:error, "Invalid email or password")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Accounts.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end

  # Private

  defp redirect_after_login(conn, user) do
    case user.is_admin do
      true -> redirect(conn, to: Routes.admin_home_path(conn, :index))
      false -> redirect(conn, to: Routes.page_path(conn, :index))
    end
  end

end