defmodule PrinterTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest AirportWeather.Printer

  test "#print prints a map of data into appropriately aligned columns" do
    data = %{foo: "foo foo", bar_string: "bar", bazbaz: "baz"}

    result = capture_io fn ->
      AirportWeather.Printer.print(data)
    end

    assert result == """
       bar:\tbar    
    bazbaz:\tbaz    
       foo:\tfoo foo
    """
  end

end
