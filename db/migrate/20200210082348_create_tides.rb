class CreateTides < ActiveRecord::Migration[5.2]
  def change
    create_table :tides do |t|

      t.timestamps
    end
  end
end
