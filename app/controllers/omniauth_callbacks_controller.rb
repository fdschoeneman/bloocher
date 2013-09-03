class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    debugger
    hash = request.env["omniauth.auth"]
    extract_email_from(hash)
    user = User.where(email: @email).first_or_create
    user.authentications.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in with #{hash.provider.titleize}!"
      sign_in_and_redirect user
      # redirect_to root_url
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end    
  end

  alias_method :facebook, :all 
  alias_method :gplus, :all  
  alias_method :linkedin, :all
  alias_method :twitter, :all 

private
  def password_required?
    super && provider.blank?
  end

  def extract_email_from(hash)
    
    if hash.provider == "facebook"
      @email = hash.info.email
    elsif provider === "twitter"
      @email = "test_email@testemail.com"      
    end 
  end
end
