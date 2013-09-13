namespace 'db:development' do 

  task prepare: [:kill_connections, :clear_objects]
end