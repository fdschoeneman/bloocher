namespace 'db:development:create' do 

  task accounts: :environment do

    accountables = %w[vineyard winery producer artist]
    
    satisfy_dependencies(accountables)

    accountables.each do |accountable|

      am = accountable.classify.constantize

      am.all[0..4].each do |object|
        unless object.name == "Vineyard" && object.vineyard_parent_id.nil?
          account = object.accounts.new(
            subdomain: "#{object.class.name.downcase.parameterize}-#{rand(1..1000)}-#{am.name.downcase}",
            activation_id: rand(1..@activations.to_i)
          )
          account.save!
        end
      end
    end
  end
end
