defmodule :"Elixir.Covid66live.Repo.Migrations.Create-virus" do
  use Ecto.Migration

  def change do
    create table(:viruses) do
      add :code, :string
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end
