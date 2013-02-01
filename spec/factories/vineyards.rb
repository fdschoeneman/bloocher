# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vineyard do
    producer_id 1
    appellation "Anderson Valley"
    topo_slope 1
    soil_composition "Boonville Loam"
    climate "cool"
    name "ferrington"
  end
end
