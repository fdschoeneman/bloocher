class CarouselSerializer < ActiveModel::Serializer
  attributes :id, :carousable_type, :carousable_id, :image_id
end
