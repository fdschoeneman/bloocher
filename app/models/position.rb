class Position < ActiveRecord::Base

  belongs_to :user
  belongs_to :positionable, polymorphic: true

  # belongs_to :imageable, polymorphic: true
  belongs_to :producer, foreign_key: :positionable_id, foreign_type: "Producer"
  # belongs_to :showcase, foreign_key: :positionable_id, foreign_type: "Showcase"
  # belongs_to :vineyard, foreign_key: :positionable_id, foreign_type: "Vineyard"
  # belongs_to :winery, foreign_key: :positionable_id, foreign_type: "Winery"
end
