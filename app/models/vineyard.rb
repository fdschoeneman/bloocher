class Vineyard < ActiveRecord::Base

  resourcify

  belongs_to :producer
  belongs_to :vineyard_parent, class_name: "Vineyard"

  has_many :addresses, as: :addressable
  has_many :appellations_vineyards
  has_many :appellations, through: :appellations_vineyards
  has_many :blocks, class_name: "Vineyard", foreign_key: :vineyard_parent_id
  has_many :fruit_lots, through: :vineyard_vintages
  has_many :images, as: :imageable
  has_many :vineyard_vintages
  has_many :wines, through: :fruit_lots

  accepts_nested_attributes_for :producer

  validates :name, :producer_id, presence: true
  # acts_as_gmappable

  # def gmaps4rails_address
  #   "281 41st street, oakland, ca 94611"
  # end
end
