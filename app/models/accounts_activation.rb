class AccountsActivation < ActiveRecord::Base

	belongs_to :account
	belongs_to :activation
end
