require 'test_helper'

class RssSourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rss_source = rss_sources(:one)
  end

  test "should get index" do
    get rss_sources_url
    assert_response :success
  end

  test "should get new" do
    get new_rss_source_url
    assert_response :success
  end

  test "should create rss_source" do
    assert_difference('RssSource.count') do
      post rss_sources_url, params: { rss_source: { name: @rss_source.name, url: @rss_source.url } }
    end

    assert_redirected_to rss_source_url(RssSource.last)
  end

  test "should show rss_source" do
    get rss_source_url(@rss_source)
    assert_response :success
  end

  test "should get edit" do
    get edit_rss_source_url(@rss_source)
    assert_response :success
  end

  test "should update rss_source" do
    patch rss_source_url(@rss_source), params: { rss_source: { name: @rss_source.name, url: @rss_source.url } }
    assert_redirected_to rss_source_url(@rss_source)
  end

  test "should destroy rss_source" do
    assert_difference('RssSource.count', -1) do
      delete rss_source_url(@rss_source)
    end

    assert_redirected_to rss_sources_url
  end
end
