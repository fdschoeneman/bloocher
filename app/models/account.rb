class Account < ActiveRecord::Base
	# require 'lib/validations/subdomain'
	# include subdomain

	belongs_to :accountable, polymorphic: true
	
  has_many :accounts_activations
	has_many :activations, through: :accounts_activations, foreign_key: "Activation"
  has_many :accounts_admins
  has_many :admins, through: :accounts_admins, foreign_key: :admin_id
  
  forbidden_subdomains = %w( support blog www billing help api 
    merciboku privacy help legal terms blog )
  subdomain_regex = /^[a-z\d]+[a-z\d-]+[^-]$/

	validates :subdomain, presence: true, uniqueness: true
	validates :subdomain, length: { within: 4..40 }
	validates :subdomain, format: { with: subdomain_regex, multiline: true, 
		message: "The subdomain can only contain numbers, letters, and dashes" }
     
  validates_exclusion_of :subdomain, in: forbidden_subdomains, 
     message: "reserved and unavailable"   

end
