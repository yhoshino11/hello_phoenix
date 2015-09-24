defmodule HelloPhoenix.PageView do
  use HelloPhoenix.Web, :view

  def message do
    # $ iex -S mix
    # iex(1)> Phoenix.View.render(HelloPhoenix.PageView, "test.html", %{})
    # {:safe, [[["" | "This is the message: "] | "Hello from the view!"] | "\n"]}
    "Hello from the view!"
  end
end
