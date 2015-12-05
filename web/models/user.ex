defmodule Unique.User do
  use Unique.Web, :model

  schema "users" do
    field :username, :string
    field :password, :string
    field :email, :string
    has_many :post, Unique.Post

    timestamps
  end

  @required_fields ~w(username password email)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:username, min: 1, max: 20)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 6, max: 255)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end
end
