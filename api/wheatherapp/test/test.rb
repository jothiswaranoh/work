require 'sinatra'
require 'httparty'
require 'json'
require 'dotenv/load'
require 'prawn'

API_KEY = ENV['WEATHER_API_KEY'] || '26b836459fc04b93bb264110232407'

get '/' do
  "Welcome to the Weather Data Table Generator!"
end

get '/weather/:location' do
  location = params[:location]

  begin
    response = HTTParty.get("http://api.weatherapi.com/v1/current.json?key=#{API_KEY}&q=#{location}")
    
    unless response.success?
      raise StandardError, "Received non-successful response with status code: #{response.code}"
    end

    weather_data = response.parsed_response
    formatted_weather_data = process_weather_data(weather_data)

    content_type :json
    { location: location, weather: formatted_weather_data }.to_json
  rescue HTTParty::Error, StandardError => e
    status 500
    content_type :json
    { error: "Error fetching weather data: #{e.message}" }.to_json
  end
end

def process_weather_data(weather_data)
  # Process weather data as before
end

# Generate PDF with the table data
get '/generate_pdf' do
  sample_data = [
    { name: "jothis", location: "Trichy, India" },
    { name: "arun", location: "Coimbatore, India" },
    { name: "vasth", location: "Chennai, India" },
    { name: "gokul", location: "Chennai, India" }
  ]

  # Fetch climate data for each location and add it to the sample_data
  sample_data.each do |data|
    response = HTTParty.get("http://api.weatherapi.com/v1/current.json?key=#{API_KEY}&q=#{data[:location]}")
    weather_data = response.parsed_response
    data[:climate] = weather_data.dig('current', 'condition', 'text')
  end

  # Generate PDF
  pdf = Prawn::Document.new
  pdf.text "Weather Data Table", size: 20, style: :bold
  pdf.move_down 20

  data_rows = [["ID", "Name", "Location", "Climate"]]
  sample_data.each_with_index do |data, index|
    data_rows << [index + 1, data[:name], data[:location], data[:climate]]
  end

  pdf.table(data_rows, header: true)

  # Send the PDF as response directly
  content_type 'application/pdf'
  pdf.render
end
