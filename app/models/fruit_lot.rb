class FruitLot < ActiveRecord::Base

  belongs_to :vineyards_vintage

  has_many :wines_fruit_lots
  has_many :wines, through: :wines_fruit_lots

  def varietal
  	self.vineyards_vintage.vineyard.varietal
  end

  def vineyard
  	self.vineyards_vintage.vineyard
  end
  
end
