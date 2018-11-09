defmodule ZcomInfra do
  use Application
  require Logger

  def start(_type, _args) do
    port = Application.get_env(:zcominfra, :comwboy_port, 8080)

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, ZcomInfra.Endpoints, [], port: port)
    ]
    Logger.info("Application started on port: #{port}")

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
