require "http"

system "clear"
puts "Welcome to the Weather App"
puts "=" * 50
puts ""

print "Enter a city: "
city = gets.chomp
puts ""

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&appid=ad55a020f8382071e966f69d41d2a5a9")

weather_data = response.parse

temperature = weather_data["main"]["temp"]
temp_low = weather_data["main"]["temp_min"]
temp_high = weather_data["main"]["temp_max"]
description = weather_data["weather"][0]["description"]

puts "Today in #{city}, it is currently #{temperature} degrees and with #{description} weather."
puts "You can expect a high of #{temp_high} and a low of #{temp_low}."

puts ""