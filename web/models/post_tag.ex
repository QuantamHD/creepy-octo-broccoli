defmodule Unique.Post_Tag do
  use Unique.Web, :model

  schema "post_tags" do
    belongs_to :tag, Unique.Tag
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

