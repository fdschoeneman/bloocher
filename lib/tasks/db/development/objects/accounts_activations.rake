namespace 'db:development:create' do 

  task accounts_activations: :environment do

  	@accounts_activations.to_i.times do |i|

      small_notice("accounts activations")

  		AccountsActivation.create(
  			account_id: i+1,
  			activation_id: rand(1..@activations)
  		)
  	end
  end
end
