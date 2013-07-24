class ShowcasesWine < ActiveRecord::Base

  belongs_to :wine 
  belongs_to :showcase 
  belongs_to :blurb, class_name: "Review"
end
