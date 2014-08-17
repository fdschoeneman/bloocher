namespace 'db:development:create' do 

  task carousels: :environment do

    satisfy_dependencies(["image"])
  end
end
