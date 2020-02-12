class Tide < ApplicationRecord
  require "httpclient"
  require "json"
  require "date"

  def self.getter
    prefecture_key = 40
    port_key = 21
    yesterday = (Date.today).to_s
    year = yesterday.split("-").first
    month = yesterday.split("-")[1]
    day = yesterday.split("-")[2]

    api_url = "https://tide736.net/api/get_tide.php?pc=#{prefecture_key}&hc=#{port_key}&yr=#{year}&mn=#{month}&dy=#{day}&rg=day"
    
    responses = JSON.parse(HTTPClient.get(api_url).body)["tide"]["chart"][yesterday]["tide"]

    responses.each do |response|
      Tide.create(time: Time.at(response["unix"]), cm: response["cm"])
    end
  end
end
