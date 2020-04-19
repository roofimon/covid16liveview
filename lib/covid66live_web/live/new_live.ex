defmodule Covid66liveWeb.NewLive do
    use Phoenix.LiveView
    alias Covid66live.Wiki
    require Logger
    @topic "live"
    def mount(_params, _session, socket) do
        Covid66liveWeb.Endpoint.subscribe(@topic)
        {:ok, assign(socket, 
                    uuid: "")
        }
    end       

    def handle_info(msg, socket) do
        {:noreply, assign(socket, uuid: msg.payload.assigns.uuid)}
    end

    def render(assigns) do
      ~L"""
      <h2> Current Val Value <%= @uuid  %> </h2>
      """
    end
end