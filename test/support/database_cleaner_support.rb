require 'database_cleaner'

# DatabaseCleaner.strategy = :transaction
# DatabaseCleaner[:active_record].clean_with :transaction


class MiniTest::Spec
  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end



# DatabaseCleaner.strategy = :transaction
# DatabaseCleaner[:active_record].clean_with :transaction


# class MiniTest::Spec
#   before :each do
#     DatabaseCleaner.start
#   end

#   # after :each do
#     DatabaseCleaner.clean
#   end
# end