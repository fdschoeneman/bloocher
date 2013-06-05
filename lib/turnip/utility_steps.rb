module UtilitySteps 

  step 'I am on the home page' do
    visit "/"
  end

  step 'I am on the :path path' do |path|
    visit "/#{path}"
  end

  step 'show me the page' do 
    save_and_open_page
  end

  step 'I follow the :link link' do |link|
    Capybara.match = :first
    click_link(link)
  end

  step 'I fill in :value for :key' do |value, key|
    Capybara.match = :first
    fill_in key, with: value
  end

  step 'I fill in :key with :value' do |key, value|
    fill_in key, with: value
  end

  step 'the :key field should contain :value' do |key, value| 
    page.has_field?(key, with: value)
  end

  step 'I press :button' do |button|
    click_link_or_button(button)
  end

  step 'I should see a notice with :text' do |text|
    page.should have_content(text)
  end

  step 'I should see an error notice with :text' do |text|
    page.should have_content(text)
  end
end