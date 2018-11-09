defmodule ZcomInfra.MixProject do
  use Mix.Project

  def project do
    [
      app: :zcom_infra,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison],
      mod: {ZcomInfra, []},
      env: [comboy_port: 8080]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.1.2"},
      {:plug, "~> 1.3.4"},
      {:httpoison, "~> 1.3"},
      {:json, "~> 1.0"}
    ]
  end
end
