class Category < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :title, scope: :user_id
  scope :user, ->(id) {
    where(:user_id => id)
  }
end
