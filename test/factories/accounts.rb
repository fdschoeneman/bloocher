# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    accountable_id 1
    accountable_type "Vineyard"
    subdomain "vineyard-subdomain-1"
  end
end
