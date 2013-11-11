class Artist < ActiveRecord::Base

	extend FriendlyId
  
  friendly_id :name, use: [:slugged, :history]

  belongs_to :artist, class_name: "User"

end
