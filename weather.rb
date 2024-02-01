# Required libraries
require 'json'
require 'open-uri'

# Function to get weather of a city
def get_weather(city)
  api_key = 'bd5e378503939ddaee76f12ad7a97608' # Replace with your OpenWeatherMap API key
  url = "http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}&units=metric"
  
  # Begin block to handle exceptions
  begin
    # Open the URL and read the response
    response = URI.open(url).read
    data = JSON.parse(response)
    
    # Check if the response is successful
    if data['cod'] == 200
      # Get the temperature and description from the data
      temperature = data['main']['temp']
      description = data['weather'].first['description']
      
      # Print the weather information
      puts "Weather in #{city}: #{description}, Temperature: #{temperature}°C"
    else
      # Print the error message if the response is not successful
      puts "Error: #{data['message']}"
    end
  # Rescue block to handle HTTP errors
  rescue OpenURI::HTTPError => e
    # Print the error message
    puts "Error: #{e.message}"
  # Rescue block to handle other exceptions
  rescue => e
    # Print the error message
    puts "Error: #{e}"
  end
end

# Prompt the user to enter the city name
print "Enter city name: "
city = gets.chomp

# Call the function to get the weather of the city
get_weather(city)