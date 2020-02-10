class AddColumnToWeather < ActiveRecord::Migration[5.2]
  def change
    add_column :weathers, :weather,:string
    add_column :weathers, :temperature,:float
    add_column :weathers, :pressure,:float
    add_column :weathers, :wind_speed,:integer
    add_column :weathers, :humidity,:float
  end
end
