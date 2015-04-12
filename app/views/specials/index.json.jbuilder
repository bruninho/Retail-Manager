json.array!(@specials) do |special|
  json.extract! special, :id, :title, :start_date, :end_date
  json.url special_url(special, format: :json)
end
