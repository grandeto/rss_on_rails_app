require "application_system_test_case"

class RssArticlesTest < ApplicationSystemTestCase
  setup do
    @rss_article = rss_articles(:one)
  end

  test "visiting the index" do
    visit rss_articles_url
    assert_selector "h1", text: "Articles Feed"
  end

  test "destroying a Rss article" do
    visit rss_articles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rss article was successfully deleted"
  end
end
