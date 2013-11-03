namespace 'db:development:create' do 

  task users: :environment do

    small_notice("generic users")
    @users.to_i.times do |n|
      name = Faker::Name.name 
      email = Faker::Internet.email
      password  = "password"
      user = User.new(name: name,
                      :email => email,
                      :password => password,
                      bio: Faker::Stoked.bio)  
      user.skip_confirmation!
      user.save!
      user.confirm!
    end
    
    testers = [
      ["hola.nicole@gmail.com", "VIP"], 
      ["fred.schoeneman@gmail.com", "Admin"]
    ]
    
    testers.each do |email, role|
      small_notice("user: #{role} account for #{email}")
    
      user = User.new(
        email: email, 
        password: "password",
        password_confirmation: "password", 
        bio: Faker::Stoked.bio
      )
      user.skip_confirmation!
      user.save
      user.confirm!
      user.add_role role
    end
  end
end


def make_admin_user

  user = User.new(
    name: "Fred Schoeneman", 
    email: "fred.schoeneman@gmail.com", 
    password: "password",
    password_confirmation: "password", 
    bio: hipster_bios.first)

  user.save!
  user.confirm!
  user.add_role :admin
end
