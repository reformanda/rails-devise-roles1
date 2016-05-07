json.array!(@award_options) do |award_option|
  json.extract! award_option, :id, :name, :nomination_type_id
  json.url award_option_url(award_option, format: :json)
end
