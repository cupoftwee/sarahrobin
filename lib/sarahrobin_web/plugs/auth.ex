defmodule Sarahrobin.Plug.Authentication do

  use Guardian.Plug.Pipeline,
    otp_app: :sarahrobin,
    error_handler: Sarahrobin.GuardianErrorHandler,
    module: Sarahrobin.Auth.Guardian

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.LoadResource, allow_blank: true

end