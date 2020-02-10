require "httpclient"
require "json"
require "date"

api_url = "https://tide736.net/api/get_tide.php?pc=40&hc=21&yr=2020&mn=02&dy=09&rg=day"
responses = HTTPClient.get(api_url).body
# responses = JSON.parse(HTTPClient.get(api_url).body)

puts JSON.parse(responses)["tide"]["chart"]["2020-02-09"]["tide"].first
puts JSON.parse(responses)["tide"]["chart"]["2020-02-09"]["tide"][1]