json.array!(@countries) do |country|
  json.extract! country, :id, :name, :destination_aptour_id
  json.url country_url(country, format: :json)
end
