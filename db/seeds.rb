require "csv"

CSV.read('db/prefectures.csv').each do |data|
  Prefecture.create(name: data.last) unless Prefecture.find_by(name: data.last)
end

City.create(name: "福岡市", prefecture_id: 134) unless City.find_by(name: "福岡市")
City.create(name: "北九州市", prefecture_id: 134) unless City.find_by(name: "北九州市")
City.create(name: "久留米市", prefecture_id: 134) unless City.find_by(name: "久留米市")
City.create(name: "札幌市", prefecture_id: 95) unless City.find_by(name: "札幌市")

Field.create(name: "御笠川", city_id: 1) unless Field.find_by(name: "御笠川")

time = Time.new(2005, 2, 21, 10, 11, 12)
FishingLog.create!(started_date: time, finished_date: time)