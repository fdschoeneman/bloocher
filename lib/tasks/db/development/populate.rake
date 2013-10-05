namespace 'db:development' do 

  desc "Populates the development database"
  task populate: [:clear_objects, :create_objects, 'db:test:prepare'] 

end
