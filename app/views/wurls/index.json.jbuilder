json.array!(@wurls) do |wurl|
  json.extract! wurl, :id, :ourl, :turl
  json.url wurl_url(wurl, format: :json)
end
