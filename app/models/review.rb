class Review < ActiveRecord::Base
 
  attr_accessor :blooch 

  belongs_to :wine
  belongs_to :reviewer, class_name: "User"

  validates :reviewer_id, :wine_id, :content, presence: true
  validates :content, length: { minimum: 6}
  validates :wine_id, numericality: true

end
