class Wine < ActiveRecord::Base
  resourcify
  # attr_accessible :cases_produced, :vintage, :winemaker_notes, :name, :ph,
  #   :winery_id, :new_french_oak, :one_yr_old_french_oak, :acid_added,  
  #   :two_yr_old_french_oak, :three_yr_old_french_oak, 
  #   :new_american_oak, :one_yr_old_american_oak, :two_yr_old_american_oak,
  #   :three_yr_old_american_oak, :bottled_on, :released_on, 
  #   :lay_down_until, :drink_before

  attr_protected :wine_id, :created_at, :updated_at


  validates :name, :vintage, presence: true
  validates :vintage, :cases_produced, numericality: true
  validates :vintage, length: { is: 4 }

  belongs_to :winery

  has_many :reviews
  has_many :winemaker_oeuvres
  has_many :winemakers, through: :winemaker_oeuvres, class_name: "User"
  has_many :wine_fruit_lots
  has_many :fruit_lots, through: :wine_fruit_lots
  has_many :vineyard_vintages, through: :fruit_lots
  has_many :vineyards, through: :vineyard_vintages

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

