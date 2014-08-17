FactoryGirl.define do
  factory :producer do
      
    sequence(:name) { |n| "Testy McTesterton#{n}" }

  end
end
