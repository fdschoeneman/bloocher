# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :image do
  
    image "MyString"
    title "MyString"
    description "MyText"
    content_type "MyString"
    imageable_id 1
    imageable_type "MyString"
    active "MyString"
    slug "MyString"
    user
  end
end
