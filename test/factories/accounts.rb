# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    # accountable_id 1
    accountable
    accountable_type "MyString"
    subdomain "MyString"
  end
end
