class TimeLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tags, through: :tags_time_logs
end
