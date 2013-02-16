class FruitLotsController < ApplicationController
  
  def index
    @fruit_lots = FruitLot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fruit_lots }
    end
  end

  def show
    @fruit_lot = FruitLot.find(params[:id])
    @json = @fruit_lot

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fruit_lot }
    end
  end

  def new
    @fruit_lot = FruitLot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fruit_lot }
    end
  end

  def edit
    @fruit_lot = FruitLot.find(params[:id])

  end

  def create
    @fruit_lot = FruitLot.new(params[:fruit_lot])

    respond_to do |format|
      if @fruit_lot.save
        format.html { redirect_to @fruit_lot, notice: 'fruit lot was successfully created.' }
        format.json { render json: @fruit_lot, status: :created, location: @fruit_lot }
      else
        format.html { render action: "new" }
        format.json { render json: @fruit_lot.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    @fruit_lot = FruitLot.find(params[:id])

    respond_to do |format|
      if @fruit_lot.update_attributes(params[:fruit_lot])
        format.html { redirect_to @fruit_lot, notice: 'fruit lot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fruit_lot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fruit_lot = FruitLot.find(params[:id])
    @fruit_lot.destroy

    respond_to do |format|
      format.html { redirect_to fruit_lots_url }
      format.json { head :no_content }
    end
  end
end
