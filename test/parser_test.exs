defmodule ParserTest do
  use ExUnit.Case

  import AirportWeather.Parser, only: [parse: 2]

  def dummy_xml do
    """
    <?xml version="1.0" encoding="ISO-8859-1"?>
    <?xml-stylesheet href="latest_ob.xsl" type="text/xsl"?>
    <outer_tag version="1.0"
       xmlns:xsd="http://www.w3.org/2001/XMLSchema"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:noNamespaceSchemaLocation="http://example.com">
       <foo>Foo</foo>
       <bar>Bar</bar>
       <baz>Baz</baz>
    </outer_tag>
    """
  end

  test "parser appropriately returns a map of fields to text values" do
    result = parse(dummy_xml, [:foo, :bar])
    assert result == %{foo: "Foo", bar: "Bar"}
  end
end
