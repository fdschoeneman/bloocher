# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :carousel do
    carousable_type "MyString"
    carousable_id 1
    image_id 1
  end
end
