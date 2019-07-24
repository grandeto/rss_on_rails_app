# frozen_string_literal: true

# Rss Sources Controller
class RssSourcesController < ApplicationController
  before_action :set_rss_source, only: [:show, :edit, :update, :destroy]

  # GET /rss_sources
  # GET /rss_sources.json
  def index
    @rss_sources = RssSource.all
  end

  # GET /rss_sources/1
  # GET /rss_sources/1.json
  def show
  end

  # GET /rss_sources/new
  def new
    @rss_source = RssSource.new
  end

  # GET /rss_sources/1/edit
  def edit
  end

  # POST /rss_sources
  # POST /rss_sources.json
  def create
    @rss_source = RssSource.new(rss_source_params)

    respond_to do |format|
      if @rss_source.save
        format.html { redirect_to @rss_source, notice: 'Rss source was successfully created.' }
        format.json { render :show, status: :created, location: @rss_source }
      else
        format.html { render :new }
        format.json { render json: @rss_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rss_sources/1
  # PATCH/PUT /rss_sources/1.json
  def update
    respond_to do |format|
      if @rss_source.update(rss_source_params)
        format.html { redirect_to @rss_source, notice: 'Rss source was successfully updated.' }
        format.json { render :show, status: :ok, location: @rss_source }
      else
        format.html { render :edit }
        format.json { render json: @rss_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rss_sources/1
  # DELETE /rss_sources/1.json
  def destroy
    @rss_source.destroy
    respond_to do |format|
      format.html { redirect_to rss_sources_url, notice: 'Rss source was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rss_source
      @rss_source = RssSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rss_source_params
      params.require(:rss_source).permit(:name, :url)
    end
end
