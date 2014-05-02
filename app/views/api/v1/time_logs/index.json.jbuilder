json.array!(@time_logs) do |time_log|
  extracted_tags = time_log.tags.map do |tag|
    {
      :id => tag.id,
      :title => tag.title
    }
  end

  json.id              time_log.id
  json.user_id         time_log.user_id
  json.category_id     time_log.category_id
  json.description     time_log.description
  json.date            time_log.date
  json.rounded_minutes time_log.rounded_minutes
  json.actual_seconds  time_log.actual_seconds
  json.timer_enabled   time_log.timer_enabled
  json.tags            extracted_tags
end
