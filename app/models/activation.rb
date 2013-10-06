class Activation < ActiveRecord::Base

	belongs_to :activator, class_name: "User"
	has_many :accounts_activations
	has_many :accounts, through: :accounts_activations
end
