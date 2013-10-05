class FruitLot < ActiveRecord::Base

  belongs_to :vineyards_vintage

  has_many :fruit_lots_wines
  has_many :wines, through: :fruit_lots_wines

  def varietal
  	self.vineyards_vintage.vineyard.varietal
  end

  def vineyard
  	self.vineyards_vintage.vineyard
  end
  
end
