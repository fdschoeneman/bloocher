class Vineyard < ActiveRecord::Base
  
  extend FriendlyId
  
  friendly_id :name, use: [:slugged, :history]

  resourcify

  belongs_to :producer
  belongs_to :vineyard_parent, class_name: "Vineyard"

  has_many :accounts, as: :accountable
  has_many :addresses_addressable, as: :addressable
  has_many :addresses, through: :addresses_addressable
  has_many :appellations_vineyards
  has_many :appellations, through: :appellations_vineyards
  has_many :blocks, class_name: "Vineyard", foreign_key: :vineyard_parent_id
  has_many :carousels, as: :carousable
  has_many :fruit_lots, through: :vineyards_vintages
  has_many :images,   as: :imageable
  has_many :positions, as: :positionable
  has_many :vineyards_vintages
  has_many :showcases, as: :showcaseable
  has_many :wines, through: :fruit_lots


  accepts_nested_attributes_for :producer

  validates :name, :producer_id, presence: true
  # acts_as_gmappable

  # def gmaps4rails_address
  #   "281 41st street, oakland, ca 94611"
  # end
end
