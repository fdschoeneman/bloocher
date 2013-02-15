class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, 
    :remember_me, :bio

  has_many :ownerships, foreign_key: :owner_id, dependent: :destroy
  has_many :producers, through: :ownerships
  has_many :winemaker_oeuvres, foreign_key: :winemaker_id
  has_many :wines_made, through: :winemaker_oeuvres, source: :wine
  has_many :wineries_owned, through: :producers, source: :wineries
  has_many :reviews, foreign_key: :reviewer_id


  
end
