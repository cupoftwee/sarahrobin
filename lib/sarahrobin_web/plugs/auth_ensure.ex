defmodule Sarahrobin.Plug.EnsureAuthentication do

  use Guardian.Plug.Pipeline,
    otp_app: :sarahrobin,
    module: Sarahrobin.Auth.Guardian

  plug Guardian.Plug.EnsureAuthenticated

end