class CarouselsController < ApplicationController
  before_action :set_carousel, only: [:show, :edit, :update, :destroy]

  def index

    @carousels = Carousel.all
  end

  def show
  end

  def new

    @carousel = Carousel.new
  end

  def edit
  end

  def create
    @carousel = Carousel.new(carousel_params)

    if @carousel.save
      redirect_to @carousel, notice: 'Carousel was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @carousel.update(carousel_params)
      redirect_to @carousel, notice: 'Carousel was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @carousel.destroy
    redirect_to carousels_url, notice: 'Carousel was successfully destroyed.'
  end

private

  def set_carousel
    @carousel = Carousel.find(params[:id])
  end

  def carousel_params
    params.require(:carousel).permit(:carousable_type, :carousable_id, :image_id)
  end
end
