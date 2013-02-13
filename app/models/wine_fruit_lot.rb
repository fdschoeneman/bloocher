class WineFruitLot < ActiveRecord::Base
  attr_accessible :fruit_lot_id, :wine_id

  belongs_to :fruit_lot
  belongs_to :wine
end
