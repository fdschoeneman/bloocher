class Showcase < ActiveRecord::Base

  has_many :showcases_wines
  has_many :wines, through: :showcases_wines
  has_many :blurbs, through: :showcases_wines, class_name: "Review"
end
