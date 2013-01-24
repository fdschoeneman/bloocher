# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    rating              89
    association   :reviewer, factory: :user
    wine   
    content             "MyText"

  end
end
