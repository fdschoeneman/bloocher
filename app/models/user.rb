class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  #associations

  # has_many :wineries, class_name: "Winery"
  has_many :ownerships, foreign_key: :owner_id, dependent: :destroy
  has_many :producers, through: :ownerships


  
end
