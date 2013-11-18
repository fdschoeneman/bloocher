class Certification < ActiveRecord::Base

  has_many :certifications_holdables
  has_many :vineyards, through: :certifications_holdables, 
                       source: :holdable, source_type: "Vineyard"
  has_many :wineries, through: :certifications_holdables, 
                     source: :holdable, source_type: "Winery"
  has_many :producers, through: :certifications_holdables, 
                       source: :holdable, source_type: "Producer"
  has_many :wines, through: :certifications_holdables, 
                       source: :holdable, source_type: "Wine"
end