json.array!(@hotels) do |hotel|
  json.extract! hotel, :id, :name, :provider_aptour_id, :operator_aptour_id
  json.url hotel_url(hotel, format: :json)
end
