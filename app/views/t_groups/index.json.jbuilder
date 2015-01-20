json.array!(@t_groups) do |t_group|
  json.extract! t_group, :id, :name, :provider_aptour_id, :operator_aptour_id
  json.url t_group_url(t_group, format: :json)
end
