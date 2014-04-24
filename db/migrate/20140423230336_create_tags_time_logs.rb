class CreateTagsTimeLogs < ActiveRecord::Migration
  def change
    create_table :tags_time_logs do |t|
      t.integer :tag_id
      t.integer :time_log_id
      t.timestamps
    end
  end
end
