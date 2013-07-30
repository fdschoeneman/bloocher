class ShowcaseSerializer < ActiveModel::Serializer
  attributes :id, :sommelier_id, :version, :name, :description, :published
end
