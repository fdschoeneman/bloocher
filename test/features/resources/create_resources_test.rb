require "test_helper"
include Capybara::Email::DSL

feature "Resources::Create Resource Feature Test" do

  setup do
    @user = FactoryGirl.create(:user)
  end

  scenario "create winery as logged in user" do 
    login_as @user
    visit new_winery_path  
    fill_in 'winery_producer_name', with: 'Breggo, Inc.'
    fill_in 'winery_name', with: 'Breggo'
    fill_in 'winery_mission', with: Faker::Stoked.sentence
    fill_in 'winery_history', with: Faker::Stoked.paragraph
    click_button 'Submit Winery'
    Winery.where(name: 'Breggo').count.must_equal 1
    Producer.where(name: 'Breggo, Inc.').count.must_equal 1
    URI.parse(current_url).request_uri.must_equal "/wineries/breggo"
  end  

  scenario "create winery as unauthenticated user" do 
    visit new_winery_path
    URI.parse(current_url).request_uri.must_equal "/users/sign_in"

    within '.user-login' do 
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: "password"
      click_button 'Log in'
    end
    fill_in 'winery_producer_name', with: 'Breggo, Inc.'
    fill_in 'winery_name', with: 'Breggo'
    fill_in 'winery_mission', with: Faker::Stoked.sentence
    fill_in 'winery_history', with: Faker::Stoked.paragraph
    click_button 'Submit Winery'
    Winery.where(name: 'Breggo').count.must_equal 1
    Producer.where(name: 'Breggo, Inc.').count.must_equal 1
    URI.parse(current_url).request_uri.must_equal "/wineries/breggo"
  end

  scenario "create winery as unregistered user" do 
    visit new_winery_path
    within '.user-signup' do 
      fill_in 'user_email', with: 'test@test.com'
      find_button('Sign up').click
    end
    page.must have_selector(".alert-box", text: /link has been sent/)
    User.where(email: "test@test.com").wont_be_nil
    open_email('test@test.com')
    current_email.click_link "Confirm my account"
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Confirm that you are a bahler'
    URI.parse(current_url).request_uri.must_equal "/wineries/new"
  end

  scenario "create a wine from a winery page" do 

  end

  scenario "create vineyard" do 
    # visit new_vineyard_path
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
