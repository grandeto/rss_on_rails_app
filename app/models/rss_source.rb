class RssSource < ApplicationRecord
  validates :name, presence: true, format: { with: /^[a-zA-Z0-9_]*$/ }, length: { in: 3..255 }
  validates :url, presence: true, url: true, uniqueness: true
end
