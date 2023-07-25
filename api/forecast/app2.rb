require 'excon'
require 'json'

# Replace 'YOUR_METEOSTAT_API_KEY' and 'YOUR_METEOSTAT_API_HOST' with your actual Meteostat API key and host
meteostat_api_key = '66fbd7b332msh1eafd8efa088d3cp130d91jsn41d111c952f1'
meteostat_api_host = 'meteostat.p.rapidapi.com'


# headers = {

#   "X-RapidAPI-Key" => '66fbd7b332msh1eafd8efa088d3cp130d91jsn41d111c952f1',

#   "X-RapidAPI-Host" => 'meteostat.p.rapidapi.com'

# }




# Latitude and Longitude of the location
latitude = 40.7128
longitude = -74.0060

# API endpoint URL to get weather data

api_endpoint = "https://#{meteostat_api_host}/stations/nearby?lat=#{latitude}&lon=#{longitude}"



headers = {
  "X-RapidAPI-Key" => meteostat_api_key,
  "X-RapidAPI-Host" => meteostat_api_host
}

# Make the GET request
response = Excon.get(api_endpoint, headers: headers)

# Check if the response is successful (status code 200)
if response.status == 200
  # Parse the JSON response
  data = JSON.parse(response.body)

  # Extract the temperature information from the data
  temperature = data['temperature']

  # Print the temperature
  puts "Temperature at (#{latitude}, #{longitude}): #{temperature}°C"
else
  # Handle the error if the response is not successful
  puts "Error: #{response.status} - #{response.body}"
end
