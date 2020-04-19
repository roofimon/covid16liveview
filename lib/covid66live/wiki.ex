defmodule Covid66live.Wiki do 
    alias Covid66live.Repo
    alias Covid66live.Info.Virus

    def get_all_viruses do
        Repo.all(Virus) 
            |> Enum.map(fn virus -> %{code: virus.code, name: virus.name, description: virus.description} end)
    end
end