namespace 'db:development:create' do 

  task activations: :environment do

    @activations.to_i.times do |i|

      Activation.create(activator_id: i+1)
    end
  end
end
