FactoryGirl.define do
  factory :winery do
    sequence :name do |n|
      "Ernest & Julio #{n}Gallo, Inc."
    end

    association         :producer

  	# factory :winery_with_wines do   

  	# 	ignore do 
  	# 		wines_count 5
  	# 	end

  	# 	after(:create) do |winery, evaluator|
  	# 		FactoryGirl.create_list(
  	# 			:wine, evaluator.wines_count, winery: winery
  	# 		)
  	# 	end  	
  	# end
  end
end
