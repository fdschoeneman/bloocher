namespace 'db:development:create' do 

  task roles: :environment do |task| 
    YAML.load(ENV['ROLES']).each do |role|
      Role.find_or_create_by(name: role)
      small_notice("role: #{role}")
    end
  end
end