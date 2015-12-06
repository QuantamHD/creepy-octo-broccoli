defmodule Unique.AdminController do
  use Unique.Web, :controller

  def index(conn, _params) do
    render conn, "admin.html"
  end
end