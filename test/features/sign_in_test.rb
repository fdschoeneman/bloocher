require "test_helper"

# To be handled correctly by Capybara this spec must end with "Feature Test"
feature "SignIn Feature Test" do
  scenario "the test is sound" do

    visit root_path
    assert page.has_title? /home/
    within(".navbar-fixed-top") { click_link("login") }
  end
end
