class ShowcaseSerializer < ActiveModel::Serializer
  attributes :id, :showcaseable_id, :showcaseable_type, :version, :name, :description, :published
end
