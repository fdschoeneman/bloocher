class VineyardVintagesController < ApplicationController
  # GET /vineyard_vintages
  # GET /vineyard_vintages.json
  def index
    @page_title = "Vineyard vintages"
    @vineyard_vintages = VineyardVintage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vineyard_vintages }
    end
  end

  # GET /vineyard_vintages/1
  # GET /vineyard_vintages/1.json
  def show
    @vineyard_vintage = VineyardVintage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vineyard_vintage }
    end
  end

  # GET /vineyard_vintages/new
  # GET /vineyard_vintages/new.json
  def new
    @vineyard_vintage = VineyardVintage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vineyard_vintage }
    end
  end

  # GET /vineyard_vintages/1/edit
  def edit
    @vineyard_vintage = VineyardVintage.find(params[:id])
  end

  # POST /vineyard_vintages
  # POST /vineyard_vintages.json
  def create
    @vineyard_vintage = VineyardVintage.new(params[:vineyard_vintage])

    respond_to do |format|
      if @vineyard_vintage.save
        format.html { redirect_to @vineyard_vintage, notice: 'Vineyard vintage was successfully created.' }
        format.json { render json: @vineyard_vintage, status: :created, location: @vineyard_vintage }
      else
        format.html { render action: "new" }
        format.json { render json: @vineyard_vintage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vineyard_vintages/1
  # PUT /vineyard_vintages/1.json
  def update
    @vineyard_vintage = VineyardVintage.find(params[:id])

    respond_to do |format|
      if @vineyard_vintage.update_attributes(params[:vineyard_vintage])
        format.html { redirect_to @vineyard_vintage, notice: 'Vineyard vintage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vineyard_vintage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vineyard_vintages/1
  # DELETE /vineyard_vintages/1.json
  def destroy
    @vineyard_vintage = VineyardVintage.find(params[:id])
    @vineyard_vintage.destroy

    respond_to do |format|
      format.html { redirect_to vineyard_vintages_url }
      format.json { head :no_content }
    end
  end
end
