json.array!(@nomination_types) do |nomination_type|
  json.extract! nomination_type, :id
  json.url nomination_type_url(nomination_type, format: :json)
end
