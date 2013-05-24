class Vineyard < ActiveRecord::Base
  resourcify
  # accessible :appellation, :climate, :producer_id, :soil_composition, :topo_aspect, :name
  
  attr_protected :vineyard_id, :created_at, :updated_at

  validates :name, :producer_id, presence: true


  has_many :wines, through: :fruit_lots
  has_many :blocks, class_name: "Vineyard", foreign_key: :vineyard_parent_id
  has_many :vineyard_vintages
  has_many :fruit_lots, through: :vineyard_vintages


  belongs_to :vineyard_parent, class_name: "Vineyard"
  belongs_to :producer

  accepts_nested_attributes_for :producer

  acts_as_gmappable

  def gmaps4rails_address
    "281 41st street, oakland, ca 94611"
  end
end
