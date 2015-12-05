defmodule Unique.Tag do
  use Unique.Web, :model

  schema "tags" do
    field :name, :string
    has_many :post_tag, Unique.Post_Tag

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:name, min: 1, max: 20)
  end
end
