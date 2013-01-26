class WineriesController < ApplicationController
  # GET /wineries
  # GET /wineries.json
  def index
    @wineries = Winery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wineries }
    end
  end

  # GET /wineries/1
  # GET /wineries/1.json
  def show
    @winery = Winery.find(params[:id])
    @wines = @winery.wines

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @winery }
    end
  end

  # GET /wineries/new
  # GET /wineries/new.json
  def new
    @winery = Winery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @winery }
    end
  end

  # GET /wineries/1/edit
  def edit
    @winery = Winery.find(params[:id])
  end

  # POST /wineries
  # POST /wineries.json
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

  # PUT /wineries/1
  # PUT /wineries/1.json
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

  # DELETE /wineries/1
  # DELETE /wineries/1.json
  def destroy
    @winery = Winery.find(params[:id])
    @winery.destroy

    respond_to do |format|
      format.html { redirect_to wineries_url }
      format.json { head :no_content }
    end
  end
end
