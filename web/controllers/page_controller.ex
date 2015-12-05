defmodule Unique.PageController do
  use Unique.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
