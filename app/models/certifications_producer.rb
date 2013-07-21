class CertificationsProducer < ActiveRecord::Base

  belongs_to :producer
  belongs_to :certification
end
