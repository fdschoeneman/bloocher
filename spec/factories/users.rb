
FactoryGirl.define do 
  
  factory :user do
    sequence(:name)       {|n| "username#{n}" }
    sequence(:email)      {|n| "user#{n}@test.com" }
    password              "password"
    confirmed_at Time.now
  end

  factory :unconfirmed_user, parent: :user do 
    confirmed_at nil
  end

  factory :confirmed_user, parent: :user do 
  end

  %w[winemaker, farmer, reviewer, owner].each do |user_role|
    factory user_role.to_sym, parent: :user do 
    end
  end
end