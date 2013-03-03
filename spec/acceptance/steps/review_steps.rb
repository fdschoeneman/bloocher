module ReviewSteps

	step "I am on a wine's page" do

		@wine = FactoryGirl.create(:wine)
		visit wine_path(@wine)
	end
end