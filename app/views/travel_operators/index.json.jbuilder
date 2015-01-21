json.array!(@travel_operators) do |travel_operator|
  json.extract! travel_operator, :id, :name, :operator_aptour_id
  json.url travel_operator_url(travel_operator, format: :json)
end
