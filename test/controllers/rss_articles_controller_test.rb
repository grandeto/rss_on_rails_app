require 'test_helper'

class RssArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rss_article = rss_articles(:one)
  end

  test "should get index" do
    get rss_articles_url
    assert_response :success
  end

  test "should destroy rss_article" do
    assert_difference('RssArticle.count', -1) do
      delete rss_article_url(@rss_article)
    end

    assert_redirected_to rss_articles_url
  end
end
