class AddressesAddressable < ActiveRecord::Base

	belongs_to :address 
	belongs_to :addressable, polymorphic: true
end
