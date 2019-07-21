# frozen_string_literal: true

require 'prop_fetcher'

# Converts Feedjira::RSSEntry into Article
class ArticleBuilder
  # Feedjira::Parser::RSSEntry => Article
  ARTICLE_MAP = {
    'title' => 'title',
    'url' => 'url',
    'last_modified' => 'published_at'
  }

  def self.build(feedjira_entry, source)
    fetched_attrs = PropFetcher.fetch(feedjira_entry, ARTICLE_MAP)
    RssArticle.create!(fetched_attrs.merge(rss_source: source))
  end
end
