class ProfilesController < ApplicationController
  
  def show

  	@user = current_user
  end

  def edit
  end

  def update
  	
		@user = User.find(params[:format])

  	if @user.update_attributes(params[:user])

  		render "show", notice: 'Profile was successfully modified.'

  	else
      	
      redirect_to root_path, notice: 'something is rottgn'
    end
  end
end
