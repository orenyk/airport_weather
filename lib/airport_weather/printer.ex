defmodule AirportWeather.Printer do

  @docmodule """
  Handles the printing of weather data.
  """

  @doc """
  Prints the data in two columns, the first being the data labels right-
  justified and the second being the weather data, left-justfied.
  """
  def print(data) do
    with columns = get_columns(data),
         widths = get_widths(columns),
         format = get_format(widths)
    do
      print_data(columns, format)
    end
  end

  @doc """
  Takes a map of weather data (the values should all be strings) and returns a
  list of printable column lists.

  ## Example
      iex> data = %{foo: "foo", bar_string: "baz"}
      iex> AirportWeather.Printer.get_columns(data)
      [["bar", "foo"], ["baz", "foo"]]
  """
  def get_columns(data) do
    [get_titles(data), Map.values(data)]
  end

  @doc """
  Takes a map and returns a list of the keys converted to strings. If any keys
  end in "_string", e.g. `:foo_string`, remove the trailing "_string".

  ## Example
      iex> AirportWeather.Printer.get_titles(%{foo: "foo", bar_string: "bar"})
      ["bar", "foo"]
  """
  def get_titles(data) do
    data |> Map.keys |> Enum.map(&to_string/1) |> Enum.map(&printable_title/1)
  end

  @doc """
  Takes a list of columns to be printed and returns a list of their maximum
  widths.

  ## Example
      iex> cols = [["foo", "bars"], ["foofoofoo", "baz"]]
      iex> AirportWeather.Printer.get_widths(cols)
      [4, 9]
  """
  def get_widths(cols) do
    for col <- cols, do: col |> Enum.map(&String.length/1) |> Enum.max
  end

  @doc """
  Converts a list of max column widths into the appropriate Erlang format
  string.

  ## Example
      iex> AirportWeather.Printer.get_format([4, 9])
      "~4s:\t~-9s~n"
  """
  def get_format(widths) do
    "~#{Enum.at(widths, 0)}s:\t~-#{Enum.at(widths, 1)}s~n"
  end

  defp print_data(columns, format) do
    columns
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.each(&(print_row(&1, format)))
  end

  defp printable_title(title) do
    Regex.replace(~r/_string\z/, title, "")
  end

  defp print_row(data, format) do
    :io.format(format, data)
  end
end
