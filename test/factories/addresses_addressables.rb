# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :addresses_addressable do
    address_id 1
    addressable_id 1
    addressable_type "MyString"
    shipping false
    primary false
  end
end
