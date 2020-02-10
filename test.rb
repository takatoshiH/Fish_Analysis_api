require "httpclient"
require "json"
require "date"

app_id = "34ba6cc32f4168e39be785f092ef2114"
location = "33.36,130.25"

time = Date.today
api_url = "https://api.darksky.net/forecast/#{app_id}/#{location},#{time}"
responses = JSON.parse(HTTPClient.get(api_url).body)

puts responses