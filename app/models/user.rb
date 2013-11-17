class User < ActiveRecord::Base

  devise :confirmable, :database_authenticatable, :invitable, :omniauthable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts_admins, foreign_key: :admin_id, dependent: :destroy
  has_many :accounts, through: :accounts_admins
  has_many :addresses_addressable, as: :addressable
  has_many :addresses, through: :addresses_addressable
  has_many :artists, foreign_key: :artist_id
  has_many :authentications, dependent: :destroy 
  has_many :certifications_holdable, as: :holdable
  has_many :certifications, through: :certifications_holdable
  has_many :images, as: :imageable
  has_many :ownerships, foreign_key: :owner_id, dependent: :destroy
  has_many :positions
  has_many :producers, through: :ownerships
  has_many :reviews, foreign_key: :reviewer_id
  has_many :showcases, as: :showcaseable
  has_many :winemaker_oeuvres, foreign_key: :winemaker_id
  has_many :wineries_owned, through: :producers, source: :wineries
  has_many :wines_made, through: :winemaker_oeuvres, source: :wine
   
  accepts_nested_attributes_for :images, :authentications

  rolify

  # has_settings do |setting|
  #   setting.key :email,   defaults: { share_on_review: 'true', share_on_follow: 'false' }
  #   setting.key :name,    defaults: { share_on_review: 'true', share_on_follow: 'false' }
  #   setting.key :address, defaults: { share_on_review: 'true', share_on_follow: 'false' }
  # end

  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  def showcase!(showcase, wine)
    showcases.showcase.showcases_wine.create!(wine)
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
