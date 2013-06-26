class Position < ActiveRecord::Base
  attr_accessible :positionable_id, :positionable_type, :title, :user_id

  belongs_to :user
  belongs_to :positionable, polymorphic: true
end
