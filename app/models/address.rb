class Address < ActiveRecord::Base

  has_many :addresses_addressables
  has_many :wineries, through: :addresses_addressables, 
                     source: :holdable, source_type: "Winery"
  has_many :vineyards, through: :addresses_addressables, 
                     source: :holdable, source_type: "vineyards"
  has_many :producers, through: :addresses_addressables, 
                     source: :holdable, source_type: "Producer"
  has_many :artists, through: :addresses_addressables, 
                     source: :holdable, source_type: "Artist"
  has_many :users, through: :addresses_addressables, 
                     source: :holdable, source_type: "User"
end

