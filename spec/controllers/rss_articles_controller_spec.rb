# frozen_string_literal: true

require 'rails_helper'

# RssArticles controller rspec tests
RSpec.describe RssArticlesController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the rss_article' do
      rss_source = create(:rss_source)
      rss_article = create(:rss_article)
      expect { delete :destroy, params: { id: rss_article.id.to_s } }.to change(RssArticle, :count).by(-1)
      expect(response).to have_http_status :redirect
      expect(flash[:notice]).to be_present
    end
  end
end
