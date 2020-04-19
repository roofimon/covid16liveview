defmodule Covid66liveWeb.NewLive do
    use Phoenix.LiveView
    alias Covid66live.Wiki
    require Logger
    @topic "live"
    def mount(_params, _session, socket) do
        Covid66liveWeb.Endpoint.subscribe(@topic)
        viruses = Wiki.get_all_viruses
        {:ok, assign(socket, 
                    viruses: viruses, 
                    val: NaiveDateTime.local_now(),
                    date: NaiveDateTime.local_now())
        }
    end

    defp put_date(socket) do
        assign(socket, date: NaiveDateTime.local_now())
    end   

    def handle_info(msg, socket) do
        Logger.debug "Handle_info"
        IO.inspect msg.payload.assigns.val
        {:noreply, assign(socket, val: msg.payload.assigns.val)}
    end

    def render(assigns) do
      Logger.debug "Render"
      ~L"""
      <h2> Current Val Value <%= @val  %> </h2>
      <div>
        <%= for virus <- @viruses do %>
            <h1>This is <%= virus.name %> : <%= virus.description %></h1>
        <% end %>
      </div>
      """
    end
end