class Tide < ApplicationRecord
  require "httpclient"
  require "json"
  require "date"

  def getter
    prefecture_key = 40
    port_key = 21
    year = 2020
    month = 2
    day = 9
    yesterday = (Date.today -1).to_s

    api_url = "https://tide736.net/api/get_tide.php?pc=#{prefecture_key}&hc=#{port_key}&yr=#{year}&mn=#{month}&dy=#{day}&rg=day"
    
    responses = JSON.parse(HTTPClient.get(api_url).body)["tide"]["chart"][yesterday]["tide"]

    responses.each do |response|
      Tide.create(time: Time.at(response["unix"]), cm: response["cm"])
    end
  end
end
