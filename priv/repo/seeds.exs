# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Sarahrobin.Repo.insert!(%Sarahrobin.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Sarahrobin.Repo

alias Sarahrobin.Auth.User


Repo.insert!(User.create_changeset(%User{}, %{
  name: "Sarah",
  email: "lol@cats.lol",
  password: "lolcatslol",
  is_admin: true
}))