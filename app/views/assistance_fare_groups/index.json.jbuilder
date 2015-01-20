json.array!(@assistance_fare_groups) do |assistance_fare_group|
  json.extract! assistance_fare_group, :id, :name, :provider_aptour_id, :operator_aptour_id
  json.url assistance_fare_group_url(assistance_fare_group, format: :json)
end
