class CreateTimeLogs < ActiveRecord::Migration
  def change
    create_table :time_logs do |t|
      t.belongs_to :user, index: true
      t.belongs_to :category, index: true
      t.string :description
      t.date :date
      t.integer :rounded_minutes
      t.integer :actual_seconds
      t.boolean :timer_enabled

      t.timestamps
    end
  end
end
