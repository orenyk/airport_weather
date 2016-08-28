# AirportWeather

This program uses the NOAA's weather feeds to display the current weather
conditions at a given US airport (identified by its 3-letter IATA code, e.g. EWR
for Newark Liberty International Airport).

This is the solution to problem `OrganizingAProject-6` from [Programming Elixir
1.2](https://pragprog.com/book/elixir12/programming-elixir-1-2) by Dave Thomas.

## TODO:

1. ~~CLI parsing~~
2. ~~Issue request to NOAA site "http://w1.weather.gov/xml/current_obs/K#{CODE}"~~
3. ~~Check HTTP response for success / failure~~
4. ~~Parse XML response~~
  - ~~Fields: Weather, Temperature, Dewpoint, Relative Humidity, Heat Index, Wind, Visibility, MSL Pressure, Altimeter~~
5. Format data nicely

### Don't forget:
* Documentation
* Logging
* Executable

