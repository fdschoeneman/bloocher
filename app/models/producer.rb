class Producer < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :city, :name, :public_email, 
  :state, :subdomain, :web_address, :zip, :winery, :wineries

  has_many :ownerships, dependent: :destroy
  has_many :owners, through: :ownerships, class_name: "User"
  has_many :wineries
  has_many :vineyards

  accepts_nested_attributes_for :wineries
end
