namespace 'db:development' do 

  desc "Remove objects from development db"
  task clear_objects: :environment do 

    puts "#{green("==>")} resetting development database"

    if Rails.env.development?

      puts "#{green("  -->")} dropping development database"
      Rake::Task['db:drop'].invoke
      puts "#{green("  -->")} creating development database"
      Rake::Task['db:create'].invoke
      puts "#{green("  -->")} loading schema into development database"
      Rake::Task['db:schema:load'].invoke
    end


  end
end