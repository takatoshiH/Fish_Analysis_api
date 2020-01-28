require "csv"

CSV.read('db/prefectures.csv').each do |data|
  Prefecture.create(name: data.last)
end