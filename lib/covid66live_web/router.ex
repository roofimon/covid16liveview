defmodule Covid66liveWeb.Router do
  use Covid66liveWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Covid66liveWeb do
    pipe_through :browser

    live("/", Counter, layout: {Covid66liveWeb.LayoutView, "app.html"})
    live("/counter", Counter, layout: {Covid66liveWeb.LayoutView, "app.html"})
    live("/viruses", VirusListLive, layout: {Covid66liveWeb.LayoutView, "app.html"})
    live("/new", NewLive, layout: {Covid66liveWeb.LayoutView, "app.html"})
  end

  # Other scopes may use custom stacks.
  # scope "/api", Covid66liveWeb do
  #   pipe_through :api
  # end
end
