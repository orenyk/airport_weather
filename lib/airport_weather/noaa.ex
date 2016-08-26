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
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  defp weather_url(code), do: "#{@weather_url}/K#{code}.xml"

  defp handle_response({:ok, %{status_code: 200, body: body}}) do
    Logger.info "Successful response"
    Logger.debug fn -> inspect(body) end
    {:ok, body}
  end

  defp handle_response({_, %{status_code: status}}) do
    Logger.error "Error #{status} returned"
    {:error, status}
  end
end
