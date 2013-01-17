class Winery < ActiveRecord::Base
  attr_accessible :producer_id, :name

  validates :name, :producer_id, presence: true

  has_many :wines
  belongs_to :producer

  accepts_nested_attributes_for :producer

end
