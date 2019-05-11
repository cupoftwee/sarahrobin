defmodule Sarahrobin.Repo.Migrations.UpdatePostsTable do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :tag, :string
    end
  end
end
