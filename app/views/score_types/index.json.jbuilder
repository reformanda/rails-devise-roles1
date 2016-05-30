json.array!(@score_types) do |score_type|
  json.extract! score_type, :id, :description, :instructions
  json.url score_type_url(score_type, format: :json)
end
