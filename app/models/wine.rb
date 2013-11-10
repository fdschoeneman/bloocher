class Wine < ActiveRecord::Base
  
  extend FriendlyId
  
  friendly_id :name, use: [:slugged, :history]
  
  resourcify
  
  validates :name, :vintage, presence: true
  validates :vintage, :cases_produced, numericality: true
  validates :vintage, length: { is: 4 }

  belongs_to :winery

  has_many :certifications_holdable, as: :holdable
  has_many :certifications, through: :certifications_holdable
  has_many :fruit_lots, through: :fruit_lots_wines
  has_many :fruit_lots_wines
  has_many :images,     as: :imageable
  has_many :positions,  as: :positionable
  has_many :reviews
  has_many :showcases, through: :showcases_wines
  has_many :showcases_wines
  has_many :vineyards_vintages, through: :fruit_lots
  has_many :vineyards, through: :vineyards_vintages

  def rating
    if self.reviews.count.zero?
      "n/a"
    else
      self.reviews.average(:rating).to_i
    end
  end

  def wine_tags
    result = Hash.new(0)
    words = self.reviews.all.map(&:content).join.delete(".,").split(" ").map
    words.each { |word| result[word] += 1 }
    result.sort_by { |k,v| v}.reverse[0..20]
  end
end

