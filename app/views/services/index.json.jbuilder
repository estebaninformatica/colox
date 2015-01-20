json.array!(@services) do |service|
  json.extract! service, :id, :name, :provider_aptour_id, :operator_aptour_id
  json.url service_url(service, format: :json)
end
