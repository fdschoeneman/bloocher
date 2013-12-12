class Showcase < ActiveRecord::Base

  extend FriendlyId
  
  friendly_id :title, use: [:slugged, :history]
  
  resourcify

  belongs_to :showcaseable, polymorphic: true
  belongs_to :sommelier, class_name: "User"
  
  has_many :blurbs, through: :showcases_wines, class_name: "Review"
  has_many :carousels, as: :carousable
  has_many :images, as: :imageable
  has_many :showcases_wines
  has_many :wines, through: :showcases_wines


  accepts_nested_attributes_for :images

  def showcasing?(wine)
    showcases_wines.find_by(wine_id: wine.id )
  end

  def showcase!(wine_id)
    showcases_wines.create!(wine_id: wine_id)
  end

  def unshowcase!(wine_id)
    showcases_wines.find_by(wine_id: wine_id).destroy
  end
end
