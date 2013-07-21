class VineyardVintage < ActiveRecord::Base
  

  belongs_to :vineyard
  
  has_many :fruit_lots


  def vintage
  	self.veraison.year
  end
end
