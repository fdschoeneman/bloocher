class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  attr_accessible :role_ids, as: :admin
  attr_accessible :name, :email, :password, :password_confirmation, :website,
    :remember_me, :bio, :phone, :address_1, :address_2, :city, :state, :zip 

  has_many :positions
  has_many :ownerships, foreign_key: :owner_id, dependent: :destroy
  has_many :producers, through: :ownerships
  has_many :winemaker_oeuvres, foreign_key: :winemaker_id
  has_many :wines_made, through: :winemaker_oeuvres, source: :wine
  has_many :wineries_owned, through: :producers, source: :wineries
  has_many :reviews, foreign_key: :reviewer_id

  rolify

  has_settings do |setting|
    setting.key :email,   defaults: { share_on_review: 'true', share_on_follow: 'false' }
    setting.key :name,    defaults: { share_on_review: 'true', share_on_follow: 'false' }
    setting.key :address, defaults: { share_on_review: 'true', share_on_follow: 'false' }
  end

  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end
end
