# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vineyard_vintage do
    vineyard_id 1
    growing_degree_days 1
    days_above_100 1
    bud_break "2013-02-08"
    bloom_date "2013-02-08"
    veraison "2013-02-08"
    last_frost "2013-02-08"
    days_of_frost 1
    average_yearly_rel_hum "9.99"
  end
end
