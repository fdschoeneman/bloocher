class Winery < ActiveRecord::Base

  extend FriendlyId

  friendly_id :name, use: :slugged

  # for cancan/rolify
  resourcify

  belongs_to :producer

  has_many :accounts, as: :accountable
  has_many :addresses_addressable, as: :addressable
  has_many :addresses, through: :addresses_addressable
  has_many :certifications_holdables, as: :holdable
  has_many :certifications, through: :certifications_holdables
  has_many :carousels, as: :carousable
  has_many :images, as: :imageable
  has_many :positions, as: :positionable
  has_many :reviews, through: :wines
  has_many :showcases, as: :showcaseable
  has_many :wines

  validates :name, presence: true
  validates :name, uniqueness: true

  include Tire::Model::Search
  include Tire::Model::Callbacks


  def producer_name
    producer.try(:name)
  end
  
  def producer_name=(name)
    self.producer = Producer.where(name: name).first_or_create if name.present?
  end

  def winery_rating
  	if self.reviews.count.zero?
  		"n/a"
    else 
    	self.reviews.average(:rating).to_i
    end
  end

  def winery_tags
  	result = Hash.new(0)
  	words = self.reviews.load.map(&:content).join.delete(".,").split(" ").map
  	words.each { |word| result[word] += 1 }
  	result.sort_by { |k,v| v}.reverse[0..20]
  end

  def vintages
    wines.pluck(:vintage).uniq.sort.reverse
  end

  def wines_in_vintage(vintage)
    wines.where(vintage: vintage)
  end


end
