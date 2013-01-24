# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :winemaker_oeuvre do
    association :winemaker, factory: :user
    wine
  end
end
