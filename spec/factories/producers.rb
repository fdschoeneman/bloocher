# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :producer do
    name                "Producer name"
    public_email        "public_email@winery-name.com"
    phone               "510.555.5555"
    address_1           "21 Winery gulch"
    address_2           "Suite 5"
    city                "Napa"
    state               "CA"
    zip                 "55555-5555"
    web_address         "gallowines.com"
    subdomain           "ernest-n-juluio-gallo"
  end
end
