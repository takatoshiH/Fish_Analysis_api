require "httpclient"
require "json"
require "date"

prefecture_key = 40
port_key = 21
yesterday = (Date.today).to_s
year = yesterday.split("-").first
month = yesterday.split("-")[1]
day = yesterday.split("-")[2]
puts day

api_url = "https://tide736.net/api/get_tide.php?pc=#{prefecture_key}&hc=#{port_key}&yr=#{year}&mn=#{month}&dy=#{yesterday}&rg=day"

puts JSON.parse(HTTPClient.get(api_url).body)

JSON.parse(HTTPClient.get(api_url).body)["tide"]["chart"][yesterday]["tide"].each do |response|
  puts Time.at(response["unix"])
  puts response["cm"]
end