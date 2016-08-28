defmodule PrinterTest do
  use ExUnit.Case
  doctest AirportWeather.Printer

  import AirportWeather.Printer, only: [get_title: 1]

  def dummy_map, do: %{weather: "Partly cloudy",
                       temperature_string: "77 F (25 C)"}

  test "get_titles removes 'string' from keys" do

  end
end
