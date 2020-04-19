defmodule Covid66liveWeb.Counter do
    use Phoenix.LiveView
    require Logger
    @topic "live"
    def mount(_params, _session, socket) do
      Logger.debug "Mount"
      Covid66liveWeb.Endpoint.subscribe(@topic)
      {:ok, assign(socket, val: UUID.uuid1(), x: "x")}
    end
  
    def handle_event("inc", _, socket) do
      Covid66liveWeb.Endpoint.broadcast_from(self(), @topic, "inc", assign(socket, val: UUID.uuid1()))
      # updated_socket = update(socket, :val,  &(&1 +1))
      {:noreply, assign(socket, x: "y", val: UUID.uuid1())}
    end
  
    def handle_event("dec", _, socket) do
      {:noreply, socket}
    end
  
    def handle_info(msg, socket) do
      Logger.debug "Handle_info"
      IO.inspect msg.payload.assigns.val
      {:noreply, assign(socket, val: msg.payload.assigns.val)}
    end

    def render(assigns) do
      Logger.debug "Render"
      ~L"""
      <div>
        <h2>The count is: <%= @val %><%= @x %></h2>
        <button phx-click="dec">-</button>
        <button phx-click="inc">+</button>
      </div>
      """
    end
  end