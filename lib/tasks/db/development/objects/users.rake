namespace 'db:development:create' do 

  task users: :environment do

    satisfy_dependencies(["role"])
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
    
    tester_roles = Role.all.pluck(:name)

    testers = [
      "fred schoeneman"
    ]

    testers.each do |fullname|
      
      tester_roles.each do |tester_role|
        small_notice("user: #{tester_role} account for #{fullname}")
        first = fullname.split.first
        last_initial = fullname.split.last.chars.first
        last = fullname.split.last
        test_domain = "@bloocher.com"
        if tester_role.nil?
          email = first + "." + last_initial + test_domain
        else
          email = first + "." + last_initial + "." + tester_role.downcase + test_domain
        end
        user = User.create( 
          name: fullname + tester_role,
          email: email,
          password: "password",
          bio: Faker::Stoked.bio
        )
        user.add_role tester_role.to_sym
      end
    end
  end
end