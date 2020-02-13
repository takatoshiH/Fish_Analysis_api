class Weather < ApplicationRecord
  validates :temperature, presence: true, numericality: true
  validates :pressure, presence: true, numericality: true
  validates :weather, presence: true

  require "httpclient"
  require "json"
  require "date"

  @@app_id = "34ba6cc32f4168e39be785f092ef2114"
  @@location = "33.36,130.25"

  # 位置情報を踏まえて天気を取得するようにすること
  def self.getter(city_key)
    (0..30).each do |number|
      time = Time.parse((Date.today - number).to_s).to_i
      unless Weather.exists?(date: time)
        api_url = "https://api.darksky.net/forecast/#{@@app_id}/#{@@location},#{time}"
        responses = JSON.parse(HTTPClient.get(api_url).body)["currently"]

        date = Time.at(responses["time"])
        temperature = responses["temperature"]
        pressure = responses["pressure"]
        weather = responses["summary"]
        wind_speed = responses["windSpeed"]
        humidity = responses["humidity"]

        Weather.create(date: date, temperature: temperature, pressure: pressure, weather: weather, wind_speed: wind_speed, humidity: humidity)
      end
    end
  end
end