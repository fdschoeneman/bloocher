class VineyardsController < ApplicationController
  
  before_action :set_vineyard, only: [:show, :edit, :update, :destroy]

  # @json = Vineyard.all.to_gmaps4rails

  def index

    @page_title = "Vineyards"
    @vineyard_parents = Vineyard.where(vineyard_parent_id: nil)
    @vineyards = Kaminari.paginate_array(@vineyard_parents).page(params[:page]).per(10)

    respond_to do |format|
      format.html 
      format.json { render json: @vineyards }
    end
  end

  def show
    
    @vineyard = Vineyard.friendly.find(params[:id])
    # @json = @vineyard.to_gmaps4rails
    respond_to do |format|
      format.html 
      format.json { render json: @vineyard }
    end
  end

  def new

    @producer = Producer.find_by_id(params[:producer_id])
    @vineyard = Winery.new

    respond_to do |format|
      format.html 
      format.json { render json: @vineyard }
    end
  end

  def edit
    @vineyard = Vineyard.find(params[:id])
  end

  def create

    @vineyard = Vineyard.new(name: params[:vineyard][:name], producer_id: params[:producer_id])

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
private

  def set_vineyard
    @vineyard = Vineyard.friendly.find(params[:id])
  end

  def vineyard_params
    params.require(:vineyard).permit(:name)
  end  
end
