require "csv"

CSV.read('db/prefectures.csv').each do |data|
  Prefecture.create(name: data.last) unless Prefecture.find_by(name: data.last)
end

City.create(name: "福岡市", prefecture_id: 134) unless City.find_by(name: "福岡市")