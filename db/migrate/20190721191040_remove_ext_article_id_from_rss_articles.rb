class RemoveExtArticleIdFromRssArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :rss_articles, :ext_article_id, :integer
  end
end
