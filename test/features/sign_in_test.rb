require "test_helper"

# To be handled correctly by Capybara this spec must end with "Feature Test"
feature "SignIn Feature Test" do
  scenario "the test is sound" do
    visit root_path
    asser page.has_selector 'title', text: /bloocher/
  end
end
