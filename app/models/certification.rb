class Certification < ActiveRecord::Base

	has_many :certifications_holdables
	has_many :holdables, through: :certifications_holdables
end
