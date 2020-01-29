class AddFishingLogToStartedtime < ActiveRecord::Migration[5.2]
  def change
    add_column :fishing_logs, :started_time,:time
  end
end
