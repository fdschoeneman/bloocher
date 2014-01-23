# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :certifications_holdable do
    holdable_id 1
    inception "2013-10-01"
    grade "MyString"
    holdable_type "MyString"
  end
end
