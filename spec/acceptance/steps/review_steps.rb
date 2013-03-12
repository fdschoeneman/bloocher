module ReviewSteps

	step "I am on a wine's page" do

		@wine = FactoryGirl.create(:wine)
		visit wine_path(@wine)
	end

	step "I am on a winery's page" do

		@winery = FactoryGirl.create(:winery_with_wines)
		visit winery_path(@winery)
	end

	step "I press the review button for the first wine" do

		click_link_or_button(@winery.wines.first.name)
	end
end