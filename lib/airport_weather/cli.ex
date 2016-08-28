defmodule AirportWeather.CLI do

  @fields Application.get_env(:airport_weather, :fields)

  @moduledoc """
  Handles the command line parsing of user input and the dispatch to the various
  functions that look up the local weather at a given US airport and display it.
  """

  def main(argv) do
    argv |> parse_args |> process
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

  defp process(:help) do
    IO.puts "airport_weather <airport code>"
    System.halt(0)
  end

  defp process(code) when is_binary(code) do
    AirportWeather.NOAA.fetch(code)
    |> decode_response
    |> AirportWeather.Parser.parse(@fields)
  end

  defp decode_response({:ok, body}), do: body
  defp decode_response({:error, status}) do
    IO.puts "Error fetching from NOAA, status code #{status}"
    System.halt(2)
  end
end
