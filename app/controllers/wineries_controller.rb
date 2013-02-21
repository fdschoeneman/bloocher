class WineriesController < ApplicationController

  def index

    @wineries = Winery.all

    respond_to do |format|
      format.html 
      format.json { render json: @wineries }
    end
  end

  def show

    @winery = Winery.find(params[:id])
    @wines = @winery.wines
    @reviews = @winery.reviews
    @winery.winery_rating

    respond_to do |format|
      format.html 
      format.json { render json: @winery }
    end
  end

  def new

    @winery = Winery.new

    respond_to do |format|
      format.html
      format.json { render json: @winery }
    end
  end

  def edit

    @winery = Winery.find(params[:id])
  end

  def create

    @winery = Winery.new(params[:winery])

    respond_to do |format|
      if @winery.save
        format.html { redirect_to @winery, notice: 'Winery was successfully created.' }
        format.json { render json: @winery, status: :created, location: @winery }
      else
        format.html { render action: "new" }
        format.json { render json: @winery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    @winery = Winery.find(params[:id])

    respond_to do |format|
      if @winery.update_attributes(params[:winery])
        format.html { redirect_to @winery, notice: 'Winery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @winery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @winery = Winery.find(params[:id])
    @winery.destroy

    respond_to do |format|
      format.html { redirect_to wineries_url }
      format.json { head :no_content }
    end
  end
end
