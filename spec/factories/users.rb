
FactoryGirl.define do 
  
  factory :user, aliases: [:confirmed_user, :winemaker, :farmer, :reviewer, :owner] do
 
    sequence(:name)       {|n| "username#{n}" }
    sequence(:email)      {|n| "user#{n}@test.com" }
    password              "password"
    confirmed_at Time.now
  end

  factory :unconfirmed_user, parent: :user do 
    confirmed_at nil
  end
end