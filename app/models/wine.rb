class Wine < ActiveRecord::Base
  attr_accessible :cases_produced, :vintage, :winemaker_notes, :name

  validates :name, :vintage, presence: true
  validates :vintage, :cases_produced, numericality: true
end
