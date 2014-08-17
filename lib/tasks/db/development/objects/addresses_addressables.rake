namespace 'db:development:create' do 

  task addresses_addressables: :environment do

    # %w[@producers @users @vineyards @wineries].each do |addressable_model|

    #   eval(model).times do |i|
    #     model = addressable_model.gsub("@", "").capitalize.singularize
    #     small_notice("addresses for #{model}")
    #     AddressesAddressable.create(
    #       address_id: rand(1..@addresses.to_i),
    #       addressable_id: i + 1,
    #       addressable_type: model
    #     )
    #   end
    # end
  end
end
