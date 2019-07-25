require "application_system_test_case"

class RssSourcesTest < ApplicationSystemTestCase
  setup do
    @rss_source = rss_sources(:one)
  end

  test "visiting the index" do
    visit rss_sources_url
    assert_selector "h1", text: "Rss Sources"
  end

  test "creating a Rss source" do
    visit rss_sources_url
    click_on "Add New Rss Source"

    fill_in "Name", with: @rss_source.name
    fill_in "Url", with: @rss_source.url
    click_on "Create Rss source"

    assert_text "Rss source was successfully created"
    click_on "Back"
  end

  test "updating a Rss source" do
    visit rss_sources_url
    click_on "Edit", match: :first

    fill_in "Name", with: @rss_source.name
    fill_in "Url", with: @rss_source.url
    click_on "Update Rss source"

    assert_text "Rss source was successfully updated"
    click_on "Back"
  end

  test "destroying a Rss source" do
    visit rss_sources_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Rss source was successfully deleted"
  end
end
