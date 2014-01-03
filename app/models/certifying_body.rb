class CertifyingBody < ActiveRecord::Base

  has_many :accounts, as: :accountable
  has_many :addresses_addressable, as: :addressable
  has_many :addresses, through: :addresses_addressable  
  has_many :certifications



end
