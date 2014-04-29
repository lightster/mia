json.array!(@categories) do |category|
  json.extract! category, :id, :title, :time_increment
end
