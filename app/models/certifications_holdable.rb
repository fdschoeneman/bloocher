class CertificationsHoldable < ActiveRecord::Base

	belongs_to :certification
	belongs_to :holdable, polymorphic: true
  belongs_to :vineyard, foreign_key: :holdable_id, foreign_type: "Vineyard"

end
