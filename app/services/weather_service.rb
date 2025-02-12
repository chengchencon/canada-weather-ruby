require 'httparty'

class WeatherService
  include HTTParty
  base_uri 'http://api.openweathermap.org/data/2.5/weather'

  def initialize(city, state)
    @city = city
    @state = state
    @api_key = 'daf558e96c2a48e9525d82ef99f22e9c'  # 使用你注册的API密钥
  end

  def get_weather
    self.class.get("", query: {
      q: "#{@city}, #{@state}, CA",  # 结合城市和省份来获取准确的天气数据
      appid: @api_key,
      units: 'metric'  # 可以使用 'imperial' 或 'metric'，用于控制温度单位，metric是摄氏度
    })
  end
end
