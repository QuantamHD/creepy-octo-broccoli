defmodule Unique.Like do
  use Unique.Web, :model

  schema "likes" do
    belongs_to :user, Unique.User
    belongs_to :post, Unique.Post

    timestamps
  end

  @required_fields ~w()
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
