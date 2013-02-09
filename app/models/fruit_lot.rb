class FruitLot < ActiveRecord::Base
  attr_accessible :brix, :harvest_date, :vineyard_vintage_id, :weight, :wine_id

  belongs_to :vineyard_vintage
end
