defmodule Sarahrobin.Plug.ShowNavbar do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _) do
    conn 
      |> assign(:navbar, true)
  end

end