class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

  def after_sign_up_path_for(resource)
    session[:previous_url] || root_path
  end

  # def store_location
  #   if (!request.fullpath.match("/users/") && !request.xhr?) 
  #     session[:previous_url] = request.fullpath
  #   end
  # end
end
