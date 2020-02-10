require "httpclient"
require "json"
require "date"

prefecture_key = 40
port_key = 21
year = 2020
month = 2
day = 9
today = (Date.today-1).to_s
puts today

api_url = "https://tide736.net/api/get_tide.php?pc=#{prefecture_key}&hc=#{port_key}&yr=#{year}&mn=#{month}&dy=#{day}&rg=day"
responses = HTTPClient.get(api_url).body
# responses = JSON.parse(HTTPClient.get(api_url).body)

JSON.parse(responses)["tide"]["chart"][today]["tide"].each do |response|
  puts Time.at(response["unix"])
  puts response["cm"]
end
# puts JSON.parse(responses)["tide"]["chart"]["2020-02-09"]["tide"][1]