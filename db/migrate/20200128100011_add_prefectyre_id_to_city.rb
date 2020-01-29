class AddPrefectyreIdToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :prefecture_id,:integer
  end
end
