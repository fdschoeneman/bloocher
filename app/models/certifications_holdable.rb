class CertificationsHoldable < ActiveRecord::Base

	belongs_to :certification
	belongs_to :holdable, polymorphic: true
end
