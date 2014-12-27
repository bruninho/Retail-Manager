json.array!(@sales) do |sale|
  json.extract! sale, :id, :total, :profit, :credit, :cash
  json.url sale_url(sale, format: :json)
end
