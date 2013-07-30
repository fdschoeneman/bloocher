require "test_helper"

describe ShowcasesWinesController do
  
  Given(:user) { create(:user) }
  Given(:showcase) { create(:showcase, sommelier_id: user.id) }
  Given(:wine) { create(:wine) }

  describe "create" do 

    Then {  
      assert_difference( 'showcase.wines.count') {
        post :create, { wine: wine, showcase: showcase.id }
      }
    }
  end


  # it "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end
