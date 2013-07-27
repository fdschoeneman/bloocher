class Producer < ActiveRecord::Base

  resourcify

  has_many :owners, through: :ownerships, class_name: "User"
  has_many :wineries
  has_many :vineyards
  has_many :certifications_producers
  has_many :certifications, through: :certifications_producers
  has_many :addresses, as: :addressable

  accepts_nested_attributes_for :wineries
end
