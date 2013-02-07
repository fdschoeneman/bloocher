class Vineyard < ActiveRecord::Base
  # accessible :appellation, :climate, :producer_id, :soil_composition, :topo_aspect, :name
  
  attr_protected :vineyard_id, :created_at, :updated_at

  validates :name, :producer_id, presence: true

  has_many :wines, through: :fruit_lots
  has_many :blocks, class_name: "Vineyard", foreign_key: :vineyard_parent_id
  has_many :fruit_lots

  belongs_to :producer
  belongs_to :vineyard_parent, class_name: "Vineyard"

  accepts_nested_attributes_for :producer

  acts_as_gmappable


  def vineyard_rating

  end

  def gmaps4rails_address
    "#{self.producer.address_1}, #{self.producer.city}, #{self.producer.zip}" 
  end
end
