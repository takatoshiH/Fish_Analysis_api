class AddColumnToRequester < ActiveRecord::Migration[5.2]
  def change
    add_column :requesters, :success, :boolean
    add_column :requesters, :name, :string
    add_column :requesters, :message, :text
    add_column :requesters, :backtrace, :text
    add_column :requesters, :weather_id, :integer
  end
end
