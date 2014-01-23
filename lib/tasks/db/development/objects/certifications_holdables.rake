namespace 'db:development:create' do 

  task certifications_holdables: :environment do

    satisfy_dependencies(["certification"])
  end
end