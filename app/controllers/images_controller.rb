class ImagesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :edit, :update]
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if @image.save
    
      redirect_to :back, notice: 'Image was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @image.update(image_params)
      redirect_to @image, notice: 'Image was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @image.destroy
    redirect_to images_url, notice: 'Image was successfully destroyed.'
  end

private
  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image, :title, :description, :content_type, 
      :active, :slug, :imageable_id, :imageable_type, :remote_image_url)
  end
end
