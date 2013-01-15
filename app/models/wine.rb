class Wine < ActiveRecord::Base
  attr_accessible :cases_produced, :vintage, :winemaker_notes, :name, :winery_id

  validates :name, :vintage, :winery_id,
            presence: true
  validates :vintage, :cases_produced, 
            numericality: true, allow_nil: true

  belongs_to :winery
end
