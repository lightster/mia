class MakeCategoryTitlesUniquePerUser < ActiveRecord::Migration
  def change
    add_index :categories, [:user_id, :title], unique: true
  end
end
