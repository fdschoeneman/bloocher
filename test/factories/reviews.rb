FactoryGirl.define do
  
  factory :review do
    rating        89
    content       "MyText"
    reviewer_id   1
    wine_id       1
    reviewer
    wine
  end

  factory :blooch, parent: :review do 
    blooch         {{ "adjective_1" => "dark",
                     "intmodifier"=>"nearly",
                     "adjective_2"=>"intelligent",
                     "wine_category"=>"sauvignon blanc",
                     "flavor_1"=>"leather",
                     "strength"=>"a modicum of",
                     "flavor_2"=>"fruit",
                     "pair_setup"=>"try with",
                     "food"=>"dark chocolate",
                     "drink_after"=>"2014",
                     "drink_before"=>"2015"
                  }}
  end
end
