defmodule Covid66liveWeb.VirusListLive do
    use Phoenix.LiveView
    alias Covid66live.Wiki
    @topic "live"
    def mount(_params, _session, socket) do
        if connected?(socket), do: :timer.send_interval(100, self(), :tick)
        {:ok, assign(socket, uuid: "", date: NaiveDateTime.local_now())}
    end
  
    def handle_info(:tick, socket) do
        Covid66liveWeb.Endpoint.broadcast_from(self(), @topic, "uuid", assign(socket, uuid: UUID.uuid1()))
        {:noreply, put_date(socket)}
    end

    defp put_date(socket) do
        assign(socket, date: NaiveDateTime.local_now())
    end    

    def render(assigns) do
      ~L"""
      <h1>Listing Viruses</h1>
      <h2>It's <%= @date %></h2>
      """
    end
end