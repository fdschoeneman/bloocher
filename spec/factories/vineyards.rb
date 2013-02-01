# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vineyard do
    producer_id 1
    appellation "Anderson Valley"
    topography "1-2 percent slope"
    soil_composition "Boonville Loam"
    climate "cool"
  end
end
