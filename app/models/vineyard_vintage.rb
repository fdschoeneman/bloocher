class VineyardVintage < ActiveRecord::Base
  attr_accessible :average_yearly_rel_hum, :bloom_date, 
  	:bud_break, :days_above_100, :days_above_100, 
  	:days_of_frost, :growing_degree_days, :last_frost, 
  	:veraison, :vineyard_id

  belongs_to :vineyard
  
  has_many :fruit_lots


  def vintage
  	self.veraison.year
  end
end
