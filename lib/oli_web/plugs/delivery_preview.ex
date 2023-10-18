defmodule Oli.Plugs.DeliveryPreview do
  use OliWeb, :html

  import Plug.Conn
  import Phoenix.Controller

  def init(_params) do
  end

  def call(conn, _params) do
    %{current_author: current_author, current_user: current_user, section: section} = conn.assigns

    if not is_nil(current_author) and is_nil(current_user),
      do:
        redirect(conn,
          to: ~p"/sections/#{section.slug}/preview"
        )
        |> halt(),
      else: conn
  end
end
