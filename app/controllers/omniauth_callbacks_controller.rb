class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    auth = request.env["omniauth.auth"]
    parse_email_from(auth)
    user = User.where(email: @email).first_or_create
    authentication = Authentication.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in!"
      sign_in_and_redirect user
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

  def password_required?
    super && provider.blank?
  end

  def parse_email_from(auth)
    
    if auth.provider == "facebook"
      @email = auth.info.email
    elsif provider === "twitter"
      @email = "test_email@testemail.com"      
    end 
  end
end
