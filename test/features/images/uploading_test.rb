require "test_helper"

feature "Images::Uploading Feature Test" do

  imageable_models = %w[producer winery wine vineyard artist]
  imageable_models.each do |imageable|
    
    setup do

      user = FactoryGirl.create(:admin)
      login_as user
      @imageable = create(imageable.to_sym)
      @imageable_url = "/#{@imageable.class.name.downcase.pluralize}/#{@imageable.id}"
    end

    scenario "upload from a #{imageable}'s page" do 
      @imageable.images.count.must_equal 0
      visit @imageable_url
      page.attach_file('image_image', dummy_file('small_dummy.png') )
      click_button "add photo"
      @imageable.images.count.must_equal 1
    end

    scenario "unauthenticated user cannot upload an image" do 
      logout
      visit @imageable_url
    #   page.wont have_button("add photo")
    end
  end
end
