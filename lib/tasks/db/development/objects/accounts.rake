namespace 'db:development:create' do 

  task accounts: :environment do

    accountables = %w[vineyard]
    satisfy_dependencies(accountables)

    accountables.each do |accountable|

      model = accountable.classify.constantize

      model.all.each do |object|
        account = object.accounts.new(
          subdomain: "#{object.class.name.downcase.parameterize}-#{rand(1..1000)}-#{model.name.downcase}",
          activation_id: rand(1..@activations.to_i)
        )
        account.save!
      end
    end
  end
end
