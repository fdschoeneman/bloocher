namespace 'db:development:create' do 

  task accounts: :environment do
    
    %w[@vineyards @producers @wineries].each do |count|
      eval(count).times do |i|
        model = count.gsub("@", "").capitalize.singularize
        account = Account.new(
      
          accountable_id: i+1,
          accountable_type: model,
          subdomain: "#{model.downcase}-#{i+1}",
          activation_id: rand(1..@activations.to_i)
        )
        account.save
      end
    end
  end
end
