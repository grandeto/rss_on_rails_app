class CreateRssArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :rss_articles do |t|
      t.references :rss_source, foreign_key: true
      t.integer :ext_article_id
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
