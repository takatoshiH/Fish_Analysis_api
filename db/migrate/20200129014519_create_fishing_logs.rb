class CreateFishingLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :fishing_logs do |t|
      t.time :started_at
      t.time :finished_at

      t.timestamps
    end
  end
end
