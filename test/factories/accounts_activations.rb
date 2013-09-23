# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :accounts_activation, :class => 'AccountsActivations' do
    account_id 1
    activation_id 1
  end
end
