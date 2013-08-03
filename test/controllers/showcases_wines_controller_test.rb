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

  Given(:showcases_wine) { create(:showcases_wine) }
  
  describe "destroy" do 

    Given { request.env["HTTP_REFERER"] = showcases_path(showcases_wine.showcase.id) }
    Then {
      assert_difference('ShowcasesWine.count', -1) {
        delete :destroy, id: showcases_wine.id
      }
    }
    And { assert_redirected_to showcases_path(showcases_wine.showcase.id) } 
  end
end
