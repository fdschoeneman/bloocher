FactoryGirl.define do
  factory :wine do
    vintage           2009
    name              "ancien chardonnay"  
    cases_produced    1
    winemaker_notes   "MyText"
    winery
  end
end
