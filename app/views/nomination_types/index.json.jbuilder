json.array!(@nomination_types) do |nomination_type|
  json.extract! nomination_type, :id, :code, :description, :awards_announcement, :implementing_instructions, :submission_form, :award_narrative, :guidelines
  json.url nomination_type_url(nomination_type, format: :json)
end
