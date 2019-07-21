class RssArticlesController < ApplicationController
  before_action :set_rss_article, only: [:destroy]

  # GET /rss_articles
  # GET /rss_articles.json
  def index
    @rss_articles = RssArticle.order('rss_articles.created_at DESC').all
  end

  # DELETE /rss_articles/1
  # DELETE /rss_articles/1.json
  def destroy
    @rss_article.destroy
    respond_to do |format|
      format.html { redirect_to rss_articles_url, notice: 'Rss article was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rss_article
      @rss_article = RssArticle.find(params[:id])
    end
end
