FactoryGirl.define do
  factory :vineyard do
		producer
    
    topo_slope 1
    soil_composition "Boonville Loam"
    climate "cool"
    name "ferrington"

    factory :vineyard_with_appellations do 

      ignore do 
        appellations_count 1
      end

      after(:create) do |vineyard, evaluator|
        FactoryGirl.create_list(
          :appellations_vineyard, 
          evaluator.appellations_count, 
          vineyard: vineyard
        )
      end
    end
  end

  factory :vineyard_block, parent: :vineyard do 
  	vineyard_parent_id 1
  	name "block1999A"

  end 
end
