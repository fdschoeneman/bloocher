class Authentication < ActiveRecord::Base

  belongs_to :user

  def self.from_omniauth(auth)
    
    where(auth.slice(:provider, :uid)).first_or_create do |authentication|
      authentication.provider = auth.provider
      authentication.uid = auth.uid
      # User.first_or_create
    end
  end

end
