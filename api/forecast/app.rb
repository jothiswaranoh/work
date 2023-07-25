require 'excon'
require 'json'
require 'cgi'
require 'axlsx'
require 'prawn'

# Replace 'YOUR_OPENWEATHERMAP_API_KEY' with your actual OpenWeatherMap API key
openweathermap_api_key = '31bed839b151164d7892a54f14b1224e'

def export_to_excel(weather_data_array)
    # Export weather data to Excel using axlsx gem
    Axlsx::Package.new do |p|
      p.workbook.add_worksheet(name: 'Weather Data') do |sheet|
        # Add header row
        sheet.add_row(['Name', 'Location', 'Description'])
  
        # Add weather data for each location
        weather_data_array.each do |data|
          sheet.add_row([data[:name], data[:location], data[:climate]]) # Use :climate instead of :weather
        end
      end
  
      # Save the Excel file
      p.serialize('weather_data.xlsx')
    end
  
    # Export weather data to PDF using prawn gem
    Prawn::Document.generate('weather_data.pdf') do
      text 'Weather Data', size: 24, style: :bold, align: :center
  
      move_down 20
  
      # Add weather data for each location
      weather_data_array.each do |data|
        text "Name: #{data[:name]}"
        text "Location: #{data[:location]}"
        text "Description: #{data[:climate]}" # Use :climate instead of :weather
  
        move_down 10
      end
    end
  end
  

# Function to fetch weather data for a given location
def fetch_weather_data(location_name, api_key)
  # Use the OpenStreetMap Nominatim API to geocode the location name
  nominatim_api_endpoint = "https://nominatim.openstreetmap.org/search/#{CGI.escape(location_name)}?format=json&limit=1"
  geocode_response = Excon.get(nominatim_api_endpoint)
  geocode_data = JSON.parse(geocode_response.body)

  if geocode_data && !geocode_data.empty?
    latitude = geocode_data[0]['lat'].to_f
    longitude = geocode_data[0]['lon'].to_f

    # Now you have the latitude and longitude, use the OpenWeatherMap API
    api_endpoint = "https://api.openweathermap.org/data/2.5/weather?lat=#{latitude}&lon=#{longitude}&appid=#{api_key}&units=metric"
    response = Excon.get(api_endpoint)

    if response.status == 200
      data = JSON.parse(response.body)
      weather_condition = data['weather'][0]['description']

      # Return the weather condition for the location
      return weather_condition.capitalize
    else
      # Handle the error if the response is not successful
      return "Error: #{response.status} - #{response.body}"
    end
  else
    # Handle the geocoding error
    return "Geocoding error: No location found for '#{location_name}'"
  end
end

# Sample data containing location information
sample_data = [
  { name: "jothis", location: "Trichy, India" },
  { name: "arun", location: "Coimbatore, India" },
  { name: "vasth", location: "Chennai, India" },
  { name: "gokul", location: "Chennai, India" }
]

# Array to hold the weather data for each location
weather_data_array = []

# Fetch weather data for each location and add it to the weather_data_array
sample_data.each do |location_data|
  location_name = location_data[:location]
  weather_condition = fetch_weather_data(location_name, openweathermap_api_key)

  # Create a hash with 'name', 'location', and 'weather' information
  weather_info = {
    name: location_data[:name],
    location: location_name,
    weather: weather_condition
  }

  # Add the weather_info hash to the weather_data_array
  weather_data_array << weather_info
end

# Export weather data to Excel
export_to_excel(weather_data_array)

# Print the weather data for each location
weather_data_array.each do |weather_info|
  puts "Name: #{weather_info[:name]}"
  puts "Location: #{weather_info[:location]}"
  puts "Weather: #{weather_info[:weather]}"
  puts "-----------------------"
end
