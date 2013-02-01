class Vineyard < ActiveRecord::Base
  attr_accessible :appellation, :climate, :producer_id, :soil_composition, :topography
end
