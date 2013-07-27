class Producer < ActiveRecord::Base

  resourcify

  has_many :wineries
  has_many :vineyards
  has_many :images, as: :imageable
  has_many :certifications_producers
  has_many :certifications, through: :certifications_producers
  has_many :addresses, as: :addressable

  accepts_nested_attributes_for :wineries
  accepts_nested_attributes_for :vineyards
  accepts_nested_attributes_for :images

  validates :name, presence: true
end
