class AddColumnToFishingLog < ActiveRecord::Migration[5.2]
  def change
    add_column :fishing_logs, :started_date,:date
    add_column :fishing_logs, :started_time,:time
    add_column :fishing_logs, :finished_date,:date
    add_column :fishing_logs, :finished_time,:time
    remove_column :fishing_logs, :finished_at,:time
    remove_column :fishing_logs, :started_time,:time
  end
end
