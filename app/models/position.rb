class Position < ActiveRecord::Base

  belongs_to :user
  belongs_to :positionable, polymorphic: true
end
