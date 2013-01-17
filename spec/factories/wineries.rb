# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :winery do
    name                "Ernest & Julio Gallo, Inc."
    producer_id         { rand(1..20) }

  end
end
