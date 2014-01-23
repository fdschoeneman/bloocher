FactoryGirl.define do
  factory :position do
    user_id 1
    positionable_id 1
    positionable_type "MyString"
    title "MyString"
  end
end
