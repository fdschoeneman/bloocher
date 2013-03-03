module AuthenticationSteps

  Warden.test_mode!
  
  step 'I am not logged in' do 

    logout
  end

  step 'I am logged in as a :user_type' do  |user_type|

    user = FactoryGirl.create( user_type.to_sym )
    login_as(user)
  end
  
  step 'I am logged in as a :user_type with email :email and password :password' do  |user_type, email, password|

    user = FactoryGirl.create( user_type.to_sym, email: email, password: password )
    login_as(user)
  end

  step 'a :user_type with email :email and password :password' do |user_type, email, password|

    FactoryGirl.create( user_type.to_sym, email: email, password: password )
  end

  step 'no user exists with an email :email' do |email|
    
    User.find_by_email(email).should be nil
  end
end
