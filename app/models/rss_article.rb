class RssArticle < ApplicationRecord
  belongs_to :rss_source
  validates :rss_source_id, presence: true, numericality: true
  validates :published_at, presence: true, date: true
  validates :title, presence: true, format: { with: /[a-zA-Z0-9_]/ }, length: { maximum: 255 }
  validates :url, presence: true, url: true, uniqueness: true
end
