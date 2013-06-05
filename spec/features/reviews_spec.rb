require 'spec_helper'

describe "Reviews" do

  subject { page }

  Given (:wine) { FactoryGirl.create(:wine) }
  Given (:reviewer) { FactoryGirl.create(:reviewer) }

  describe "GET /reviews" do

    describe "success" do 

      When { visit reviews_path }
      Then { page.title.should =~ /Blooches/ }
    end

    describe "should list the name of the wine" do 
      
      When { visit winery_path(wine.winery.id) }
      Then { within("#collapse#{wine.id}") { should have_link("details", href: wine_path(wine.id)) } }
      
      describe "leave pro notes" do 

        When { within("#collapse#{wine.id}") do   
            click_on "Blooch"
          end  
        }

        describe "without email redirects to signin" do 

          When { fill_in 'review_content', with: "random review text"
                 click_on 'Publish this blooch' }

          Then { page.should have_selector('title', text: "Bloocher") 
                 page.should have_selector('#flash_notice', text: "Please login") }


          describe "and successful signin redirects back to winery page" do 

            When { within("#signin") {
              fill_in 'user_email', with: reviewer.email
              fill_in 'user_password', with: reviewer.password
              click_button('Sign in') 
            } }
            
            # Then { save_and_open_page } 
          end
    

          # Then { should redirect_to new_user_session_path }
          # Then { should have_selector('#flash_notice', text: "Please login") }
          # Then { save_and_open_page }

        end 
      end

      
      describe "bloochinator" do


      end 
    end
  end

end
