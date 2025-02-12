class WeatherController < ApplicationController
  def show
    @city = params[:city] || 'Select a province or territory'  # 设置默认值
    @state = params[:state]  || 'Select a city first'       # 设置默认值


    if @city.present? && @state.present? && @state != "Select a province"
      weather_service = WeatherService.new(@city, @state)
      @weather_data = weather_service.get_weather

    # 如果返回的 API 状态不是 200，表示获取失败
      if @weather_data["cod"] != 200
        @weather_data = nil
      end
    end
  end
end
