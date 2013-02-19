class WineFruitLot < ActiveRecord::Base

  attr_accessible :fruit_lot_id, :wine_id, :percent_of_wine

  belongs_to :fruit_lot
  belongs_to :wine
end
