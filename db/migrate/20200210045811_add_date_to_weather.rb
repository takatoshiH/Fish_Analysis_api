class AddDateToWeather < ActiveRecord::Migration[5.2]
  def change
    add_column :weathers, :date, :datetime
  end
end
