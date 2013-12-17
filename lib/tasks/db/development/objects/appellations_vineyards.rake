namespace 'db:development:create' do 

  task appellations_vineyards: :environment do

    satisfy_dependencies(["appellation", "vineyard"])

    Vineyard.all.each do |vineyard|

      # vineyard.appellations.new(
      #   appellation_id: rand(1..@appellations.to_i)
      # )
  	end
  end
end
