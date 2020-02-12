class AddPrefectureKeyToPrefecture < ActiveRecord::Migration[5.2]
  def change
    add_column :prefectures, :prefecture_key, :integer
  end
end
