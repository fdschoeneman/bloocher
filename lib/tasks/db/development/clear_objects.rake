namespace 'db:development' do 

  desc "Remove objects from development db"
  task clear_objects: :environment do 

    puts "resetting development database".green

    if Rails.env.development?

      puts " dropping test & development db's".green
      Rake::Task['db:drop:all'].invoke
      puts "creating development db".green
      Rake::Task['db:create'].invoke
      puts "loading schema into development db".green
      Rake::Task['db:schema:load'].invoke
    end
  end
end