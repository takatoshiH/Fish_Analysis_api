class Weather < ApplicationRecord
  validates :temperature, presence: true, numericality: true
  validates :pressure, presence: true, numericality: true
  validates :weather, presence: true

  require "httpclient"
  require "json"
  require "date"

  @@app_id = "34ba6cc32f4168e39be785f092ef2114"

  def self.getter(location)
    (0..15).each do |number|
      unless Weather.exists?(date: Date.today - number)
        api_url = "https://api.darksky.net/forecast/#{@@app_id}/#{location},#{time}"
        responses = JSON.parse(HTTPClient.get(api_url).body)["currently"]

        date = Time.at(responses["time"])
        temperature = convert_to_celsius(responses["temperature"])
        pressure = responses["pressure"]
        weather = responses["summary"]
        wind_speed = responses["windSpeed"]
        humidity = responses["humidity"]

        Weather.create(date: date, temperature: temperature, pressure: pressure, weather: weather, wind_speed: wind_speed, humidity: humidity)
      end
    end
  end

  private
  def self.convert_to_celsius(temperature)
    ((temperature - 32) / 1.8).round(1)
  end
end