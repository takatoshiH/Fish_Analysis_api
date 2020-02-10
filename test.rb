require "httpclient"
require "json"
require "date"

app_id = "34ba6cc32f4168e39be785f092ef2114"
location = "33.36,130.25"

time = Time.parse((Date.today).to_s).to_i
api_url = "https://api.darksky.net/forecast/#{app_id}/#{location},#{time}"
responses = JSON.parse(HTTPClient.get(api_url).body)

puts Time.at(responses["currently"]["time"])
puts responses["currently"]["temperature"]
puts responses["currently"]["pressure"]
puts responses["currently"]["summary"]
puts responses["currently"]["windSpeed"]
puts responses["currently"]["humidity"]