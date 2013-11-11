class Producer < ActiveRecord::Base

  extend FriendlyId
  
  friendly_id :name, use: [:slugged, :history]

  resourcify

  has_many :accounts, as: :accountable
  has_many :addresses_addressable, as: :addressable
  has_many :addresses, through: :addresses_addressable  
  has_many :carousels, as: :carousable
  has_many :certifications_holdable, as: :holdable
  has_many :certifications, through: :certifications_holdable
  has_many :images, as: :imageable
  has_many :positions, as: :positionable
  has_many :vineyards
  has_many :wineries
  has_many :wines, through: :wineries

  accepts_nested_attributes_for :wineries
  accepts_nested_attributes_for :wines
  accepts_nested_attributes_for :vineyards
  accepts_nested_attributes_for :images

  validates :name, presence: true
end
