# frozen_string_literal: true

# Fetch Rss Feeds Worker
class FetchRssWorker
  include Sidekiq::Worker
  delegate :logger, to: Rails

  def perform
    RssSource.all.reduce(0) do |count, source|
      begin
        raw_feed = Feedjira::Feed.fetch_and_parse(source.url)
      rescue Feedjira::FetchFailure, Faraday::ConnectionFailed => e
        logger.info("Unable to fetch #{source.url}: #{e.message}")
        next count
      rescue Feedjira::NoParserAvailable => e
        logger.info("No parser available for source #{source.url}: #{e.message}")
        next count
      end

      entries_ready_to_save = raw_feed.entries.reject do |entry|
        RssArticle.where(url: entry.url).exists?
      end

      entries_to_save = 0

      entries_ready_to_save.map do |entry|
        if !entry.last_modified
          next
        end

        entry.sanitize!
        ArticleBuilder.build(entry, source)
        entries_to_save += 1
      end

      count + entries_to_save
    end
  end
end
