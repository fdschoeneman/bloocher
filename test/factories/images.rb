# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :image do
  
    image "MyString"
    # image Rack::Test::UploadedFile.new(File.join(Rails.root, 'support', 'support', 'images', '1.jpg')) 
    title "MyString"
    description "MyText"
    content_type "MyString"
    imageable_id 1
    imageable_type "MyString"
    active "MyString"
    slug "MyString"
    user
  end
end
