class Account < ActiveRecord::Base

	belongs_to :accountable, polymorphic: true
	belongs_to :activation
end
