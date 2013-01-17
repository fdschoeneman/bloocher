class Review < ActiveRecord::Base
  attr_accessible :content, :rating, :reviewer_id, :wine_id
end
