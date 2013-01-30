# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :winery do
    sequence :name do |n|
      "Ernest & Julio #{n}Gallo, Inc."
    end

    association         :producer

  end
end
