json.array!(@destinations) do |destination|
  json.extract! destination, :id, :name, :destination_aptour_id
  json.url destination_url(destination, format: :json)
end
