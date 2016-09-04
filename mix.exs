defmodule AirportWeather.Mixfile do
  use Mix.Project

  def project do
    [app: :airport_weather,
     version: "0.1.0",
     elixir: "~> 1.3",
     name: "Airport Weather",
     source_url: "https://github.com/orenyk/airport_weather",
     escript: escript_config,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      httpoison: "~> 0.9.0",
      sweet_xml: "~> 0.6.1",
      ex_doc: "~> 0.12",
      earmark: "~> 1.0"
    ]
  end

  defp escript_config do
    [main_module: AirportWeather.CLI]
  end
end
