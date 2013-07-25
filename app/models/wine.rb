class Wine < ActiveRecord::Base
  resourcify

  validates :name, :vintage, presence: true
  validates :vintage, :cases_produced, numericality: true
  validates :vintage, length: { is: 4 }

  belongs_to :winery

  has_many :reviews
  has_many :showcases, through: :showcases_wines
  has_many :showcases_wines
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

