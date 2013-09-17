namespace 'db:development' do 

  desc "Populates the development database"
  task populate: [:prepare, :create_objects] do

  end
end
