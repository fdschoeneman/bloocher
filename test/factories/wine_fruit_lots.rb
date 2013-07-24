FactoryGirl.define do
  factory :wine_fruit_lot do
    wine
    fruit_lot

    after(:create) do |wine_fruit_lot| 
    	FactoryGirl.create(:fruit_lot) 
    end

  end
end
