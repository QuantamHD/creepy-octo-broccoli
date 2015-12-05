defmodule Unique.Comment do
  use Unique.Web, :model

  schema "comments" do
    field :body, :string
    belongs_to :user, Unique.User
    belongs_to :post, Unique.Post

    timestamps
  end

  @required_fields ~w(body)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:body, min: 1, max: 1000)
  end
end

