class AddColumnToTide < ActiveRecord::Migration[5.2]
  def change
    add_column :tides, :cm, :float
    add_column :tides, :time, :datetime
  end
end
