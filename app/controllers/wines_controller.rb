class WinesController < ApplicationController

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
    @winemakers = @wine.winemakers
    @review = Review.new

    respond_to do |format|
      format.html
      format.json { render json: @wine }
    end
  end

  def new
    
    debugger
    
    @winery = Winery.find(params[:winery_id])
    @wine = @winery.wines.build


    respond_to do |format|
      format.html # new.html.erb
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
end
