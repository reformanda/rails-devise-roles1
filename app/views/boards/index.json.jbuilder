json.array!(@boards) do |board|
  json.extract! board, :id, :description, :start_date, :end_date, :nomination_type_id
  json.url board_url(board, format: :json)
end
