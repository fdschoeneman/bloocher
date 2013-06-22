class Appellation < ActiveRecord::Base
  attr_accessible :description, :map, :name, :type

  has_many :appellations_vineyards
end
