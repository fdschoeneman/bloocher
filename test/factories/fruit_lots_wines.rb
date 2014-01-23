FactoryGirl.define do
  factory :fruit_lots_wine do
    wine
    fruit_lot

    after(:create) do |fruit_lots_wine| 
    	FactoryGirl.create(:fruit_lot) 
    end

  end
end
