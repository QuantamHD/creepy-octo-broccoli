defmodule Unique.SessionController do
  use Unique.Web, :controller

  plug :scrub_params, "session" when action in [:create]

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"username" => usrname, "password"=> pass}}) do
    case Unique.Auth.login_username_and_pass(conn, usrname, pass, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: post_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username/password")
        |> render("new.html")
    end
  end
end
