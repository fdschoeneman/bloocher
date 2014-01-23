namespace 'db:development:create' do 

  task appellations_vineyards: :environment do

    satisfy_dependencies(["appellation"])
  end
end
