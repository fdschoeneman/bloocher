# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :fruit_lot do
    brix 									22
    weight 								1
    harvest_date 					"2013-02-08"
    
    vineyard_vintage
  end
end
