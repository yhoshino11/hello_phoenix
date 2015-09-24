defmodule HelloPhoenix.PageController do
  use HelloPhoenix.Web, :controller

  plug :assign_welcome_message, "Hello !" when action in [:msg, :index, :plain]

  def index(conn, _params) do
    conn
    # See web/templates/layout/app.html.eex
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error.")
    |> render "index.html"
  end

  def show(conn, %{"msg" => message}) do
    render conn, "show.html", content: message
  end

  def msg(conn, _params) do
    conn
    |> assign(:message, "Welcome Back!")
    |> assign(:name, "Yhoshino11")
    |> render "message.html"
  end

  def plain(conn, _params) do
    conn
    |> put_layout(false)
    |> render "index.html"
  end

  def params(conn, params) do
    # http://localhost:4000/params/?_format=text&message=WORLD
    render conn, "index.text", message: params["message"]
  end

  def error(conn, _params) do
    conn
    |> put_status(:not_found)
    |> render(HelloPhoenix.ErrorView, "404.html")
  end

  def to_root(conn, _params) do
    # redirect conn, to: "/"
    redirect conn, to: root_path(conn, :index)
  end

  def external(conn, _params) do
    redirect conn, external: "http://elixir-lang.org/"
  end

  def api(conn, %{"id" => id}) do
    json conn, %{id: id}
  end

  def success(conn, _params) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "success")
  end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :message, msg)
  end
end
