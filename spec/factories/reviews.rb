FactoryGirl.define do
  
  factory :review do
    rating              89
    content             "MyText"
    reviewer_id         1
    wine_id             1
    reviewer
    wine
  end
end
