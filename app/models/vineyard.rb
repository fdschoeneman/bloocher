class Vineyard < ActiveRecord::Base
  attr_protected :vineyard_id, :created_at, :updated_at

  validates :name, :producer_id, presence: true

  has_many :wines, through: :fruit_lots
  has_many :blocks, class_name: "Vineyard", foreign_key: :vineyard_parent_id
  has_many :fruit_lots

  belongs_to :producer

  accepts_nested_attributes_for :producer


  def vineyard_rating

  end
  # accessible :appellation, :climate, :producer_id, :soil_composition, :topo_aspect, :name
end
