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
        wine_fruit_lots_count 5
      end

      after(:create) do |wine, evaluator|
        FactoryGirl.create_list(:wine_fruit_lot, 
          evaluator.wine_fruit_lots_count, wine: wine
        )
      end
    end


    # association :winemaker, factory: :user
    # vineyard_vintage
    # vineyard
    # fruit_lot
  end
end
