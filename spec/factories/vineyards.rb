# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vineyard do
		association :producer
		    # vineyard_parent_id 1
    appellation "Anderson Valley"
    topo_slope 1
    soil_composition "Boonville Loam"
    climate "cool"
    name "ferrington"
  end

  factory :vineyard_block, parent: :vineyard do 
  	vineyard_parent_id 1
  	name "block1999A"
  end 
end
