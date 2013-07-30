class ShowcaseSerializer < ActiveModel::Serializer
  attributes :id, :version, :name, :description, :published
end
