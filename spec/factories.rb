# frozen_string_literal: true

# FactoryBot definitions
FactoryBot.define do
  factory :rss_article do
    rss_source
    title { 'Ruby on Rails' }
    url { 'https://rubyonrails.org/test' }
    published_at { '2019-06-24 15:00:00' }
  end

  factory :rss_source do
    name { 'InfoQ News' }
    url { 'https://feed.infoq.com/test' }
  end
end
