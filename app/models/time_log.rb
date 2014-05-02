class TimeLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tags_time_logs
  has_many :tags, through: :tags_time_logs
  scope :user, ->(id) {
    where(:user_id => id)
  }
end
