# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account_activation, :class => 'AccountActivations' do
    account_id 1
    activation_id 1
  end
end
