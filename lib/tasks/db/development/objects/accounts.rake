namespace 'db:development' do 

  task accounts: :environment do

    accountable_types = %w[Producer Winery Vineyard]
    @dev_accounts.times do |account|
      account = Account.new(
        # accountable_id: rand(1..@dev_producers),
        # accountable_type: accountable_types.sample,
        # subdomain: "#{accountable_type.lowercase}-#{accountable_id}-subdomain",
        activation_id: rand(1..@dev_activations)
      )
      account.save
    end
  end
end
