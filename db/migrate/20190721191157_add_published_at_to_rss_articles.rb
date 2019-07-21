class AddPublishedAtToRssArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :rss_articles, :published_at, :datetime
  end
end
