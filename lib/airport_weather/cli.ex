defmodule AirportWeather.CLI do
  
  @moduledoc """
  Handles the command line parsing of user input and the dispatch to the various
  functions that look up the local weather at a given US airport and display it.
  """

  def main(argv) do
    argv |> parse_args
  end

  @doc """
  `argv` can be -h or --help, which returns :help. Otherwise it is an IATA
  airport code, which is simply returned as the result.

  ## Example
      iex> AirportWeather.CLI.parse_args(["-h", "foo"])
      :help
      iex> AirportWeather.CLI.parse_args(["EWR"])
      "EWR"
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv,
                               switches: [help: :boolean],
                               aliases: [h: :help])
    case parse do
      { [help: true], _, _ } -> :help
      { _, [code], _ } -> String.upcase code
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts "airport_weather <airport code>"
    System.halt(0)
  end

  def process(code) when is_binary(code) do
    code
  end
end
