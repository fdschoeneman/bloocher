FactoryGirl.define do
  factory :user do
    name "testy mctesterton"
    email "testy.mctesteron@test.com"
    password "password"

    factory "admin" do 

      after(:create) do |user|
        user.add_role(:admin)
      end
    end
  end
end
