# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :position do
    user_id 1
    positionable_id 1
    positionable_type "MyString"
    title "MyString"
  end
end
