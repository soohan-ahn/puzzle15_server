json.array!(@scoretables) do |scoretable|
  json.extract! scoretable, :id, :name, :time
  json.url scoretable_url(scoretable, format: :json)
end
