# frozen_string_literal: true

require 'rails_helper'

# RssSources controller rspec tests
RSpec.describe RssSourcesController, type: :controller do
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

  describe 'GET show' do
    it 'has a 200 status code' do
      rss_source = create(:rss_source)
      get :show, params: { id: rss_source.id.to_s }
      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end
  end

  describe 'POST create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          rss_source: {
            name: 'InfoQ News',
            url: 'https://feed.infoq.com/news/'
          }
        }
      end
      it 'creates a new rss_source' do
        expect { post :create, params: valid_params }.to change(RssSource, :count).by(+1)
        expect(response).to have_http_status :redirect
        expect(response).to redirect_to rss_sources_url + '/' + RssSource.last.id.to_s
        expect(flash[:notice]).to be_present
      end
    end
  end

  describe 'GET edit' do
    it 'edits the rss_source' do
      rss_source = create(:rss_source)
      get :edit, params: { id: rss_source.id.to_s }
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE rss_sources#destroy' do
    it 'deletes the rss_source' do
      rss_source = create(:rss_source)
      expect { delete :destroy, params: { id: rss_source.id.to_s } }.to change(RssSource, :count).by(-1)
      expect(response).to have_http_status :redirect
      expect(flash[:notice]).to be_present
    end
  end
end
