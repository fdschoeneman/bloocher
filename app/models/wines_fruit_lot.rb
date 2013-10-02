class WinesFruitLot < ActiveRecord::Base

  belongs_to :fruit_lot
  belongs_to :wine
end
