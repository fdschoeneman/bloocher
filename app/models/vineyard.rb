class Vineyard < ActiveRecord::Base
  resourcify

  has_many :addresses, as: :addressable
  has_many :wines, through: :fruit_lots
  has_many :blocks, class_name: "Vineyard", foreign_key: :vineyard_parent_id
  has_many :vineyard_vintages
  has_many :fruit_lots, through: :vineyard_vintages
  has_many :appellations_vineyards
  has_many :appellations, through: :appellations_vineyards

  belongs_to :vineyard_parent, class_name: "Vineyard"
  belongs_to :producer

  accepts_nested_attributes_for :producer

  validates :name, :producer_id, presence: true
  # acts_as_gmappable

  # def gmaps4rails_address
  #   "281 41st street, oakland, ca 94611"
  # end
end
