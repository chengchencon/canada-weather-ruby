require_relative 'services/weather_service'

# 创建一个 WeatherService 实例，传入城市和省份
weather_service = WeatherService.new('Vancouver', 'BC')

# 获取天气数据
response = weather_service.get_weather

# 检查是否成功返回数据
if response.success?
  puts "Weather in #{response['name']}, #{response['sys']['country']}:"
  puts "Temperature: #{response['main']['temp']}°C"
  puts "Weather: #{response['weather'][0]['description']}"
  puts "Humidity: #{response['main']['humidity']}%"
  puts "Wind Speed: #{response['wind']['speed']} m/s"
else
  puts "Failed to retrieve weather data: #{response.code} - #{response.message}"
end
