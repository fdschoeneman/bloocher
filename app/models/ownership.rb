class Ownership < ActiveRecord::Base
  
  attr_accessible :owner_id, :producer_id

  belongs_to :owner, class_name: "User"
  belongs_to :producer
end
