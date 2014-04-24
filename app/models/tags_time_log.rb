class TagsTimeLog < ActiveRecord::Base
  belongs_to :tag
  belongs_to :time_log
end
