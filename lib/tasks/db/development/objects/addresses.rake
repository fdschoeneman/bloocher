namespace 'db:development:create' do 

  task addresses: :environment do

    addressable_models = %w[vineyard winery producer artist]
    satisfy_dependencies(addressable_models)

  	addressable_models.each do |model|
      model.classify.constantize.all.each do |object|

        address = object.addresses.create(
    			address_1: Faker::Address.street_address,
    			address_2: Faker::Address.street_suffix,
    			city: Faker::Address.city,
    			state: Faker::Address.state_abbr,
    			country: Faker::Address.country,
    			public_phone: Faker::PhoneNumber.phone_number,
          public_email: Faker::Internet.email
    		)
      end
    end
  end
end
