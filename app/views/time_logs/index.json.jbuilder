json.array!(@time_logs) do |time_log|
  json.extract! time_log, :id, :user_id, :category_id, :description, :date, :rounded_minutes, :actual_seconds, :timer_enabled
  json.url time_log_url(time_log, format: :json)
end
