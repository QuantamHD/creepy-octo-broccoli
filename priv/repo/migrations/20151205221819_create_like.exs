defmodule Unique.Repo.Migrations.CreateLike do
  use Ecto.Migration

  def change do
    create table(:likes) do
      add :user_id, references(:users)
      add :post_id, references(:posts)

      timestamps
    end
  end
end
