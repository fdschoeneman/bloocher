class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  after_filter :store_location

  def store_location
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_sign_up_path_for(resource)
    session[:previous_url] || root_path
  end
end
