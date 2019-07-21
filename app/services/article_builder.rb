# frozen_string_literal: true

require 'prop_fetcher'

# Converts Feedjira::RSSEntry into Article
class ArticleBuilder
  # Feedjira::Parser::RSSEntry => Article
  ARTICLE_MAP = {
    'entry_id' => 'ext_article_id',
    'title' => 'title',
    'url' => 'url'
  }

  def self.build(feedjira_entry, source)
    fetched_attrs = PropFetcher.fetch(feedjira_entry, ARTICLE_MAP)
    RssArticle.create!(fetched_attrs.merge(rss_source: source))
  end
end
