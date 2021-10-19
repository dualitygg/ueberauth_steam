defmodule UeberauthSteam.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ueberauth_steam,
      description: "Steam OpenID Strategy for Überauth.",
      version: "0.1.4",
      elixir: "~> 1.12",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),

      # Testing
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      dialyzer: [ignore_warnings: "dialyzer.ignore-warnings"],

      # Docs
      name: "Überauth Steam",
      source_url: "https://github.com/shinyscorpion/ueberauth_steam",
      homepage_url: "https://github.com/shinyscorpion/ueberauth_steam",
      docs: [
        main: "readme",
        extras: ["README.md"],
      ],
    ]
  end

  def package do
    [
      name: :ueberauth_steam,
      maintainers: ["Ian Luites"],
      licenses: ["MIT"],
      files: [
        "lib/ueberauth", "lib/ueberauth_steam.ex", "mix.exs", "README*", "LICENSE*", # Elixir
      ],
      links: %{
        "GitHub" => "https://github.com/shinyscorpion/ueberauth_steam",
      },
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      # Dependencies
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0"},
      {:ueberauth, "~> 0.7"},

      # Testing
      {:meck, "~> 0.9.2", only: :test},

      # Code Maintenance
      {:credo, "~> 1.5", only: [:dev, :test]},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.25", only: :dev},
      {:excoveralls, "~> 0.14", only: :test},
      {:inch_ex, "~> 2.0", only: [:dev, :test]},
    ]
  end
end
