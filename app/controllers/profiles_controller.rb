class ProfilesController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :ensure_correct_user,   only: [:update]


  respond_to :json, :html

  def show

  	@user = current_user
  end

  def edit
  end

  def update
  	
    debugger
		@user = User.find(params[:id])

  	if @user.update_attributes(params[:user])

  		render "show", notice: 'Profile was successfully modified.'

  	else
      	
      redirect_to root_path, notice: 'something is rotten'
    end
  end

private

  def ensure_correct_user

    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user == @user
  end
end
