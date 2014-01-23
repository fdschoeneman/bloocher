class Appellation < ActiveRecord::Base

  has_many :appellations_vineyards
  has_many :vineyards, through: :appellations_vineyards
  
end
