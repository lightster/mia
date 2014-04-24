json.array!(@categories) do |category|
  json.extract! category, :id, :user_id, :title, :time_increment
  json.url category_url(category, format: :json)
end
