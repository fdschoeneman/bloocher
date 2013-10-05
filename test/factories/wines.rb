FactoryGirl.define do
  factory :wine do
    vintage           2009
    sequence(:name)    { |n| "ancien chardonnay#{n}"  }
    cases_produced    1
    winemaker_notes   "MyText"
    winery

    factory :wine_with_reviews do  
      
      ignore do
        reviews_count 5
      end

      after(:create) do |wine, evaluator|
        FactoryGirl.create_list(:review, evaluator.reviews_count, wine: wine)
      end
    end

    factory :wine_with_fruit_lots do 

      ignore do 
        fruit_lots_wine_count 5
      end

      after(:create) do |wine, evaluator|
        FactoryGirl.create_list(:fruit_lots_wine, 
          evaluator.fruit_lots_wine_count, wine: wine
        )
      end
    end
  end
end
