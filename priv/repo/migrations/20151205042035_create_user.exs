defmodule Unique.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :password, :string
      add :email, :string

      timestamps
    end
    create index(:users, [:username], unique: true)
    create index(:users, [:email], unique: true)  
  end
end
