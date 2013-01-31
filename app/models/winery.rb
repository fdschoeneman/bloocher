class Winery < ActiveRecord::Base
  attr_accessible :producer_id, :name

  validates :name, :producer_id, presence: true

  has_many :wines
  has_many :reviews, through: :wines
  belongs_to :producer

  accepts_nested_attributes_for :producer

  def winery_rating
  	if self.reviews.count.zero?
  		"n/a"
    else 
    	self.reviews.average(:rating).to_i
    end
  end

  def winery_tags
  	result = Hash.new(0)
  	words = self.reviews.all.map(&:content).join.delete(".,").split(" ").map
  	words.each { |word| result[word] += 1 }
  	result.sort_by { |k,v| v}.reverse[0..20]
  end

end
