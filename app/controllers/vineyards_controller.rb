class VineyardsController < ApplicationController
  
  @json = Vineyard.all.to_gmaps4rails

  def index

    @vineyard_parents = Vineyard.where(vineyard_parent_id: nil)
    @vineyards = Kaminari.paginate_array(@vineyard_parents).page(params[:page]).per(10)

    respond_to do |format|
      format.html 
      format.json { render json: @vineyards }
    end
  end

  def show
    @vineyard = Vineyard.find(params[:id])
    @json = @vineyard.to_gmaps4rails

    respond_to do |format|
      format.html 
      format.json { render json: @vineyard }
    end
  end

  def new
    @vineyard = Vineyard.new

    respond_to do |format|
      format.html 
      format.json { render json: @vineyard }
    end
  end

  def edit
    @vineyard = Vineyard.find(params[:id])
  end

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

  def destroy
    @vineyard = Vineyard.find(params[:id])
    @vineyard.destroy

    respond_to do |format|
      format.html { redirect_to vineyards_url }
      format.json { head :no_content }
    end
  end
end
