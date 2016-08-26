defmodule AirportWeather.NOAA do

  require Logger

  @docmodule """
  Serves as an interface with the NOAA local weather API
  """

  @user_agent [{"User-agent", "Elixir okanner@gmail.com"}]
  @weather_url Application.get_env(:airport_weather, :weather_url)

  def fetch(code) do
    Logger.info "Fetching local weather at #{code}"
    weather_url(code)
  end

  defp weather_url(code), do: "#{@weather_url}/K#{code}.xml"
end
