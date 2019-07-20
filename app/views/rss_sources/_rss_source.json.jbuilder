json.extract! rss_source, :id, :name, :url, :created_at, :updated_at
json.url rss_source_url(rss_source, format: :json)
