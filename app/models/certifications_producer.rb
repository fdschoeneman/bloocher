class CertificationsProducer < ActiveRecord::Base
  attr_accessible :certification_id, :producer_id

  belongs_to :producer
  belongs_to :certification
end
