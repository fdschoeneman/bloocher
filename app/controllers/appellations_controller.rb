class AppellationsController < ApplicationController
  # GET /appellations
  # GET /appellations.json
  def index
    @appellations = Appellation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appellations }
    end
  end

  # GET /appellations/1
  # GET /appellations/1.json
  def show
    @appellation = Appellation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appellation }
    end
  end

  # GET /appellations/new
  # GET /appellations/new.json
  def new
    @appellation = Appellation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appellation }
    end
  end

  # GET /appellations/1/edit
  def edit
    @appellation = Appellation.find(params[:id])
  end

  # POST /appellations
  # POST /appellations.json
  def create
    @appellation = Appellation.new(params[:appellation])

    respond_to do |format|
      if @appellation.save
        format.html { redirect_to @appellation, notice: 'Appellation was successfully created.' }
        format.json { render json: @appellation, status: :created, location: @appellation }
      else
        format.html { render action: "new" }
        format.json { render json: @appellation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appellations/1
  # PUT /appellations/1.json
  def update
    @appellation = Appellation.find(params[:id])

    respond_to do |format|
      if @appellation.update_attributes(params[:appellation])
        format.html { redirect_to @appellation, notice: 'Appellation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appellation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appellations/1
  # DELETE /appellations/1.json
  def destroy
    @appellation = Appellation.find(params[:id])
    @appellation.destroy

    respond_to do |format|
      format.html { redirect_to appellations_url }
      format.json { head :no_content }
    end
  end
end
