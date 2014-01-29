require "test_helper"

feature "Resources::Create Resource Feature Test" do

  setup do

    user = FactoryGirl.create(:admin)
    login_as user
  end

  scenario "create winery" do 
    visit new_winery_path
    fill_in 'winery_producer_name', with: 'Breggo, Inc.'
    fill_in 'winery_name', with: 'Breggo'
    fill_in 'winery_mission', with: Faker::Stoked.sentence
    fill_in 'winery_history', with: Faker::Stoked.paragraph
    click_button 'Create Winery'
    Winery.where(name: 'Breggo').count.must_equal 1
    Producer.where(name: 'Breggo, Inc.').count.must_equal 1
    URI.parse(current_url).request_uri.must_equal "/wineries/breggo"
  end

  scenario "create vineyard" do 
    visit new_vineyard_path
    # save_and_open_page
    # fill_in 'vineyard_producer_name', with: 'Breggo, Inc.'
    # fill_in 'vineyard_name', with: 'Breggo'
    # fill_in 'vineyard_mission', with: Faker::Stoked.sentence
    # fill_in 'winery_history', with: Faker::Stoked.paragraph
    # click_button 'Create Winery'
    # Winery.where(name: 'Breggo').count.must_equal 1
    # Producer.where(name: 'Breggo, Inc.').count.must_equal 1
    # URI.parse(current_url).request_uri.must_equal "/wineries/breggo"
  end
end
#   imageable_models = %w[producer winery wine vineyard awrtist]
#   imageable_models.each do |imageable|
    

#     scenario "upload from a #{imageable}'s page" do 
#       @imageable.images.count.must_equal 0
#       visit @imageable_url
#       page.attach_file('image_image', dummy_file('small_dummy.png') )
#       click_button "add photo"
#       @imageable.images.count.must_equal 1
#     end

#     scenario "unauthenticated user cannot upload an image" do 
#       logout
#       visit @imageable_url
#     #   page.wont have_button("add photo")
#     end
#   end
# end
