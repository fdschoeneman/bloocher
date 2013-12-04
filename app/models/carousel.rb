class Carousel < ActiveRecord::Base 

  has_many :carousels_images
  has_many :images, through: :carousels_images
  belongs_to :carousable, polymorphic: true
end
