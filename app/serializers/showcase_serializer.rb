class ShowcaseSerializer < ActiveModel::Serializer
  attributes :id, :sommelier_id, :version, :title, :description, :published
  has_many :showcases_wines
end
