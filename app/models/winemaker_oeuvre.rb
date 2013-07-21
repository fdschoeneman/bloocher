class WinemakerOeuvre < ActiveRecord::Base

  validates :wine_id, :winemaker_id, presence: true

  belongs_to :wine
  belongs_to :winemaker, class_name: "User"
end
