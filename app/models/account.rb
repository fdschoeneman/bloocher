class Account < ActiveRecord::Base

	belongs_to :accountable, polymorphic: true
	
	has_many :accounts_activation
	has_many :activations, through: :accounts_activations
end
