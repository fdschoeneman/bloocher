class Activation < ActiveRecord::Base

	has_many :accounts_activations
	has_many :accounts, through: :accounts_activations
end
