class ProducersController < ApplicationController

  before_action :set_producer, only: [:show, :edit, :update, :destroy]

  def index
    @page_title = "Producers"
    @producers = Producer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @producers }
    end
  end

  def show
    @producer = Producer.find(params[:id])
    @wineries = @producer.wineries
    @vineyards = @producer.vineyards

    respond_to do |format|
      format.html 
      format.json { render json: @producer }
    end
  end

  def new
    @producer = Producer.new
    @producer.wineries.build

    respond_to do |format|
      format.html
      format.json { render json: @producer }
    end
  end

  def edit
    @producer = Producer.find(params[:id])
  end

  def create

    @producer = Producer.new(producer_params)
  
    respond_to do |format|
      if @producer.save
        format.html { redirect_to @producer, notice: 'Producer was successfully created.' }
        format.json { render json: @producer, status: :created, location: @producer }
      else
        format.html { render action: "new" }
        format.json { render json: @producer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @producer.update_attributes(producer_params)
        format.html { redirect_to @producer, notice: 'Producer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @producer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @producer = Producer.find(params[:id])
    @producer.destroy

    respond_to do |format|
      format.html { redirect_to producers_url }
      format.json { head :no_content }
    end
  end

private

  def set_producer
    @producer = Producer.find(params[:id])
  end

  def producer_params
    params.require(:producer).permit(:name)
  end  
end
