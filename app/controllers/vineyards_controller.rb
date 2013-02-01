class VineyardsController < ApplicationController
  # GET /vineyards
  # GET /vineyards.json
  def index
    @vineyards = Vineyard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vineyards }
    end
  end

  # GET /vineyards/1
  # GET /vineyards/1.json
  def show
    @vineyard = Vineyard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vineyard }
    end
  end

  # GET /vineyards/new
  # GET /vineyards/new.json
  def new
    @vineyard = Vineyard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vineyard }
    end
  end

  # GET /vineyards/1/edit
  def edit
    @vineyard = Vineyard.find(params[:id])
  end

  # POST /vineyards
  # POST /vineyards.json
  def create
    @vineyard = Vineyard.new(params[:vineyard])

    respond_to do |format|
      if @vineyard.save
        format.html { redirect_to @vineyard, notice: 'Vineyard was successfully created.' }
        format.json { render json: @vineyard, status: :created, location: @vineyard }
      else
        format.html { render action: "new" }
        format.json { render json: @vineyard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vineyards/1
  # PUT /vineyards/1.json
  def update
    @vineyard = Vineyard.find(params[:id])

    respond_to do |format|
      if @vineyard.update_attributes(params[:vineyard])
        format.html { redirect_to @vineyard, notice: 'Vineyard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vineyard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vineyards/1
  # DELETE /vineyards/1.json
  def destroy
    @vineyard = Vineyard.find(params[:id])
    @vineyard.destroy

    respond_to do |format|
      format.html { redirect_to vineyards_url }
      format.json { head :no_content }
    end
  end
end
