defmodule CliTest do
  use ExUnit.Case
  doctest AirportWeather.CLI

  import AirportWeather.CLI, only: [parse_args: 1]

  test "parse_args returns :help if -h or --help are passed" do
    assert parse_args(["-h", "foo"]) == :help
    assert parse_args(["--help", "foo"]) == :help
    assert parse_args(["foo", "-h"]) == :help
  end

  test "parse_args returns any other single input passed in upper case" do
    assert parse_args(["foo"]) == "FOO"
  end

  test "parse_args returns :help for any other input" do
    assert parse_args(["foo", "bar"]) == :help
  end
end
