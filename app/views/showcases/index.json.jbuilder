json.array!(@showcases) do |showcase|
  json.extract! showcase, :showcaseable_id, :showcaseable_type, :version, :name, :description, :published
  json.url showcase_url(showcase, format: :json)
end
