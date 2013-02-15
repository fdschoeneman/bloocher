class WinemakerOeuvre < ActiveRecord::Base
  attr_accessible :wine_id, :winemaker_id

  validates :wine_id, :winemaker_id, presence: true

  belongs_to :wine
  belongs_to :winemaker, class_name: "User"
end
