class Category < ActiveRecord::Base
  belongs_to :user
  scope :user, ->(id) {
    where(:user_id => id)
  }
end
