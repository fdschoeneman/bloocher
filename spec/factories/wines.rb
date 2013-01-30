FactoryGirl.define do
  factory :wine do
    vintage           2009
    sequence(:name)    { |n| "ancien chardonnay#{n}"  }
    cases_produced    1
    winemaker_notes   "MyText"
    association       :winery
  end
end
