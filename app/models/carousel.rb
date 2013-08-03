class Carousel < ActiveRecord::Base 

  belongs_to :image
  belongs_to :carousable, polymorphic: true
end
