class CarouselsImage < ActiveRecord::Base

  belongs_to :image
  belongs_to :carousel
end
