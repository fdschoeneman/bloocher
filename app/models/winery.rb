class Winery < ActiveRecord::Base
  attr_accessible :producer_id, :name

  validates :name, :producer_id, presence: true

  has_many :wines
  has_many :reviews, through: :wines
  belongs_to :producer

  accepts_nested_attributes_for :producer

  def winery_rating
    self.reviews.average(:rating)
  end

end
