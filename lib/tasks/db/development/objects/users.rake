namespace 'db:development' do 

  task users: :environment do

    small_notice("generic users")
    10.times do |n|
      name = Faker::Name.name 
      email = Faker::Internet.email
      password  = "password"
      user = User.new(name: name,
                      :email => email,
                      :password => password,
                      bio: Faker::Company.bs)  
      user.skip_confirmation!
      user.save!
      user.confirm!
    end
    
    test_users = ["hola.nicole@gmail.com"]
    
    test_users.each do |email|

      small_notice("test account for #{email})")

      user = User.new(
        email: email, 
        password: "password",
        password_confirmation: "password", 
        bio: hipster_bios.first
      )
      user.skip_confirmation!
      user.save
      user.confirm!
      user.add_role :VIP
    end
  end
end


# # def make_admin_user

# #   user = User.new(
# #     name: "Fred Schoeneman", 
# #     email: "fred.schoeneman@gmail.com", 
# #     password: "password",
# #     password_confirmation: "password", 
# #     bio: hipster_bios.first)

# #   user.save!
# #   user.confirm!
# #   user.add_role :admin
# # end
