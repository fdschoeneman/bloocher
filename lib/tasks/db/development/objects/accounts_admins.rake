namespace 'db:development:create' do 

  task accounts_admins: :environment do

  	@accounts_admins.to_i.times do |i|

  		AccountsAdmin.create(
  			account_id: i+1,
  			admin_id: rand(0..@users)
  		)
  	end
  end
end
