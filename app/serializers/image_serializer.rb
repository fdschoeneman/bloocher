class ImageSerializer < ActiveModel::Serializer
  attributes :id, :image, :title, :description, :content_type, :imageable_id, :imageable_type, :active, :slug
end
