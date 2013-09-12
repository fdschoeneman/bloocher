class WinesController < ApplicationController

  # require 'google/api_client'

  def index
    @page_title = "Wines"
    @wines = Wine.order(:created_at).page params[:page]

    respond_to do |format|
      format.html
      format.json { render json: @wines }
    end
  end

  def show
    @wine = Wine.find(params[:id])
    @page_title = @wine.name
    @reviews = @wine.reviews
    @fruit_lots = @wine.fruit_lots
    @wine_fruit_lots = @wine.wine_fruit_lots.order("percent_of_wine")
    @vineyards = @wine.vineyards
    @winemakers = @wine.positions
    @review = Review.new

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
  end

  def new
    
    @winery = Winery.find(params[:winery_id])
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

    @wine = Wine.new(params[:wine])
    @wine.winery_id = params[:winery_id]

    respond_to do |format|
      if @wine.save
        format.html { redirect_to @wine, notice: 'Wine was successfully created.' }
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
end
