class WinemakerOeuvre < ActiveRecord::Base
  attr_accessible :wine_id, :winemaker_id

  # validations
  validates :wine_id, :winemaker_id, presence: true

  # associations
  belongs_to :wine
  belongs_to :winemaker, class_name: "User"
end
