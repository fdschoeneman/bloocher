class FruitLot < ActiveRecord::Base
  attr_accessible :brix, :harvest_date, :vineyard_vintage_id, :weight, :wine_id

  belongs_to :vineyard_vintage

  has_many :wine_fruit_lots
  has_many :wines, through: :wine_fruit_lots

  def varietal
  	self.vineyard_vintage.vineyard.varietal
  end

  def vineyard
  	self.vineyard_vintage.vineyard
  end
  
end
