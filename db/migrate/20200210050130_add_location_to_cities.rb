class AddLocationToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :location, :string
  end
end
