defmodule Covid66liveWeb.Counter do
    use Phoenix.LiveView
    require Logger
    @topic "live"
    def mount(_params, _session, socket) do
      Logger.debug "Mount"
      Covid66liveWeb.Endpoint.subscribe(@topic)
      {:ok, assign(socket, uuid: "")}
    end
  
    def handle_info(msg, socket) do
      {:noreply, assign(socket, uuid: msg.payload.assigns.uuid)}
    end

    def render(assigns) do
      Logger.debug "Render"
      ~L"""
      <div>
        <h2>The count is: <%= @uuid %></h2>
      </div>
      """
    end
  end