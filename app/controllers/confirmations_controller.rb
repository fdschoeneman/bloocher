class ConfirmationsController < Devise::ConfirmationsController
  
  def show
    self.resource = resource_class.find_by_confirmation_token(params[:confirmation_token])
    super if resource.nil? or resource.confirmed?
  end

  def confirm

    self.resource = resource_class.find_by_confirmation_token(user_params[:confirmation_token])
  
    if resource.update_attributes(user_params.except(:confirmation_token)) && resource.password_match?
      self.resource = resource_class.confirm_by_token(user_params[:confirmation_token])
      # set_flash_message :notice, :confirmed
      sign_in(resource)
      # sign_in_and_redirect(resource_name, resource)
  
    else
      render :action => "show"
    end
  end

private
  
  def user_params
    params.require(:user).permit(:password, :password_confirmation, :confirmation_token)
  end

end