FactoryGirl.define do
  factory :wines_fruit_lot do
    wine
    fruit_lot

    after(:create) do |wines_fruit_lot| 
    	FactoryGirl.create(:fruit_lot) 
    end

  end
end
