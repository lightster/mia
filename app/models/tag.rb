class Tag < ActiveRecord::Base
  has_many :tags_time_logs
  has_many :time_logs, through: :tags_time_logs
end
