# frozen_string_literal: true

# Fetch Rss Feeds Task: rake fetch_rss
task :fetch_rss => :environment do
  # https://github.com/ddollar/foreman/issues/159
  $stdout.sync = true

  logger = Logger.new(STDOUT)
  new_posts_count = FetchRssWorker.new.perform
  logger.info "Articles added: #{new_posts_count}"
end
