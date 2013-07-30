FactoryGirl.define do 
  
  factory :user, aliases: [:confirmed_user, :winemaker, :farmer, :reviewer, :owner] do
 
    sequence(:name)       {|n| "username#{n}" }
    sequence(:email)      {|n| "user#{n}@test.com" }
    password              "password"
    confirmed_at Time.now

    factory :admin do 
      after(:create) { |user| user.add_role(:admin) } 
    end

    factory :user_with_showcase do 
      after(:create) { |user| user.showcases.create(showcase)}
    end
  end

  factory :unconfirmed_user, parent: :user do 
    confirmed_at nil
  end
end