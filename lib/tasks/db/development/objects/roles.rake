namespace 'db:development' do 

  task roles: :environment do |task| 
    YAML.load(ENV['ROLES']).each do |role|
      Role.find_or_create_by(name: role)
      puts "#{green("    --")} Making role: " << role
    end
  end
end