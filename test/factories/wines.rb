FactoryGirl.define do
  factory :wine do
    vintage           2009
    sequence(:name)    { |n| "ancien chardonnay#{n}"  }
    cases_produced    1
    winemaker_notes   "MyText"
    winery

    ignore do
      reviews_count 5
    end

    after(:create) do |wine, evaluator|
      FactoryGirl.create_list(:review, evaluator.reviews_count, wine: wine)
    end

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
