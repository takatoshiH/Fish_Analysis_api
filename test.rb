require "httpclient"
require "json"
require "date"


api_url = "https://tide736.net/api/get_tide.php?pc=#{prefecture_key}&hc=#{port_key}&yr=#{year}&mn=#{month}&dy=#{day}&rg=day"

JSON.parse(HTTPClient.get(api_url).body)["tide"]["chart"][today]["tide"].each do |response|
  puts Time.at(response["unix"])
  puts response["cm"]
end