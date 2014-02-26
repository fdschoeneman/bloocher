class WinesController < ApplicationController

  respond_to :json, :html
  before_action :set_wine, only: [:show, :edit, :update, :destroy]

  layout "new_resource", only: [:new, :edit]
  
  def index
    @page_title = "Wines"
    @wines = Wine.order(:created_at).page params[:page]

    respond_to do |format|
      format.html
      format.json { render json: @wines }
    end
  end

  def show
    @reviews = @wine.reviews
    @review = Review.new
    @fruit_lots = @wine.fruit_lots_wines.order("percent_of_wine")
    @vineyards = @wine.vineyards
    @winemakers = @wine.positions

    respond_to do |format|
      format.html
      format.json { render json: @wine }

      format.svg  { render :qrcode => wine_short_url, :level => :l, :unit => 10 }
      format.png  { render :qrcode => request.url 
        debugger
      }
      format.gif  { render :qrcode => request.url }
      format.jpeg { render :qrcode => request.url }
    end
    @page_title = @wine.name
  end

  def new
    @winery = Winery.friendly.find(params[:winery_id])
    @wine = @winery.wines.build

    respond_to do |format|
      format.html 
      format.json { render json: @wine }
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def create

    @wine = Wine.new(wine_params)
    # @winery = 
# debugger
    respond_to do |format|
      if @wine.save
        format.html { redirect_to @wine.winery, notice: 'Wine was successfully created.' }
        format.json { render json: @wine, status: :created, location: @wine }
      else
        format.html { render action: "new" }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @wine = Wine.find(params[:id])

    respond_to do |format|
      if @wine.update_attributes(params[:wine])
        format.html { redirect_to @wine, notice: 'Wine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy

    respond_to do |format|
      format.html { redirect_to wines_url }
      format.json { head :no_content }
    end
  end

private

  def wine_short_url
    shorten_url!("bloocher.com") 
  end

  def shorten_url!(url)
    require 'google/api_client'
    client = Google::APIClient.new(
      :application_name => "Bloocher",
      :key => 'AIzaSyDu8IFCALXESDHzBKfkGQDEkDjTQC2HfLk',
      :authorization => nil
    )

    urlshortener = client.discovered_api('urlshortener', 'v1')
    result = client.execute(
      :api_method => urlshortener.url.insert,
      :body_object => { 'longUrl' => url }
    )
    result.data.id
  end

private

  def set_wine

    @wine = Wine.friendly.find(params[:id])
  end

  def wine_params

    params.require(:wine).permit(["winery_id", "vintage", "cases_produced", "days_in_oak", "winery_id", "lay_down_until", "drink_before", "acid_added", "bottled_on", "released_on", "name", "winemaker_notes", "ph", "residual_sugar", "alcohol", "new_french_oak", "one_yr_old_french_oak", "two_yr_old_french_oak", "three_yr_old_french_oak", "new_american_oak", "one_yr_old_american_oak", "two_yr_old_american_oak", "three_yr_old_american_oak", "created_at", "updated_at", "category", "short_url"])
  end
end