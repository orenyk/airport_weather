defmodule AirportWeather.Parser do

  import SweetXml

  @moduledoc """
  Handles the parsing of the XML response from NOAA.
  """

  @doc """
  Parses an XML string and returns a map of the text values of a given list of
  fields, passed as a list of atoms.
  """
  def parse(body, fields) do
    body |> xmap(generate_xpath(fields))
  end

  defp generate_xpath(fields) do
    for field <- fields do
      {field, ~x"//#{field}/text()"s}
    end
  end
end
