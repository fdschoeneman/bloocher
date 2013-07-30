json.array!(@producers) do |producer|
  json.extract! producer, 
  json.url producer_url(producer, format: :json)
end
