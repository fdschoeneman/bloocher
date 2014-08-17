class AccountsAdmin < ActiveRecord::Base

  rolify

	belongs_to :admin, class_name: "User"
	belongs_to :account
end
