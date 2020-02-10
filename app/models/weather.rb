class Weather < ApplicationRecord
  validates :temperature, presence: true, numericality: true
  validates :pressure, presence: true, numericality: true
  validates :weather, presence: true

  require "httpclient"
  require "json"
  require "date"

  @@app_id = "34ba6cc32f4168e39be785f092ef2114"
  @@location = "33.36,130.25"

  def self.get_weather
    time = Time.parse((Date.today).to_s).to_i
    api_url = "https://api.darksky.net/forecast/#{@@app_id}/#{@@location},#{time}"
    responses = JSON.parse(HTTPClient.get(api_url).body)

    date =  Time.at(responses["currently"]["time"])
    temperature = responses["currently"]["temperature"]
    pressure = responses["currently"]["pressure"]
    weather = responses["currently"]["summary"]
    windSpeed = responses["currently"]["windSpeed"]
    humidity = responses["currently"]["humidity"]

    Weather.create(date: date, temperature: temperature, pressure: pressure, weather: weather, wind_speed: windSpeed, humidity: humidity)
  end
end