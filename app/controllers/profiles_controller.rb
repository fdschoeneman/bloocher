class ProfilesController < ApplicationController
  
  before_action :authenticate_user!, only: [:show]

  respond_to :json, :html

  def show

  	@user = User.find_by(id: params[:id])
    @address = Address.new
  end

  def edit
  end

  def update
  	
		@user = User.find(params[:id])

  	if @user.update_attributes(params[:user])

  		render "show", notice: 'Profile was successfully modified.'

  	else
      	
      redirect_to root_path, notice: 'something is rotten'
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
