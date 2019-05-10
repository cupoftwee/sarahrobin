defmodule Sarahrobin.GuardianErrorHandler do
  use SarahrobinWeb, :controller

  def auth_error(conn, _, _opts) do
    conn
    |> put_flash(:error, "Sign in to continue")
    |> redirect(to: Routes.session_path(conn, :new))
  end

  
end