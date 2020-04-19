defmodule Covid66liveWeb.VirusListLive do
    use Phoenix.LiveView
    alias Covid66live.Wiki
    @topic "live"
    def mount(_params, _session, socket) do
        if connected?(socket), do: :timer.send_interval(1000, self(), :tick)
        viruses = Wiki.get_all_viruses
        {:ok, assign(socket, viruses: viruses, date: NaiveDateTime.local_now())}
    end
  
    def handle_info(:tick, socket) do
        Covid66liveWeb.Endpoint.broadcast_from(self(), @topic, "inc", assign(socket, val: UUID.uuid1()))
        {:noreply, put_date(socket)}
    end

    defp put_date(socket) do
        assign(socket, date: NaiveDateTime.local_now())
    end    

    def render(assigns) do
      ~L"""
      <h1>Listing Viruses</h1>
      <h2>It's <%= NimbleStrftime.format(@date, "%H:%M:%S") %></h2>
      <table>
        <%= for virus <- @viruses do %>
        <tr>
          <td><b><%= virus.name %></b> (<%= virus.code %>)</td>
        </tr>
        <% end %> 
      </table>
      """
    end
end