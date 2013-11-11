require "test_helper"

describe ImagesController do 

  Given(:user) { create(:user) }
  Given(:image_attrs) { attributes_for(:image) }

  describe "create" do 

    Given { sign_out user }
    
    %w[producer winery vineyard user].each do |model|

      describe "logged out user" do

        describe "cannot create an image for #{model}" do 
          Given(:resource) { create(model.to_sym) }
          Then { assert_no_difference(['Image.count', 'resource.images.count']) { 
            post :create, { 
              image: image_attrs, imageable_id: resource, imageable_type: resource.class.name 
              }
            } 
          }
          And { assert_redirected_to new_user_session_path }
        end
      end
    end

    describe "as logged in user" do

      Given { sign_in user } 
      
      describe "from her profile" do 
        
        Given { request.env["HTTP_REFERER"] = profile_path(user) }
        Then { 
          assert_difference('Image.count') { 
            post :create, image: image_attrs 
          } 
        }
        And { assert_redirected_to profile_path(user) } 
      end

      Given(:producer) { create(:producer) }
      Given(:producer_image_attrs) { 
        attributes_for(
          :image, imageable_id: producer.id, imageable_type: "Producer"
        ) 
      }
      describe "from a producer page" do 
        
        Given { request.env["HTTP_REFERER"] = producer_path(producer) }
        Then { 
          assert_difference(['producer.images.count','Image.count']) { 
            post :create, image: producer_image_attrs
          }
        }
        And { assert_redirected_to producer_path(producer) }
      end

      Given(:winery) { create(:winery) }
      Given(:winery_image_attrs) { 
        attributes_for(
          :image, imageable_id: winery.id, imageable_type: "Winery"
        ) 
      }

      describe "from a winery page" do 
        
        Given { request.env["HTTP_REFERER"] = winery_path(winery) }
        Then { 
          assert_difference(['winery.images.count','Image.count']) { 
            post :create, image: winery_image_attrs
          }
        }
        And { assert_redirected_to winery_path(winery) }
      end

      Given(:vineyard) { create(:vineyard) }
      Given(:vineyard_image_attrs) { 
        attributes_for(
          :image, imageable_id: vineyard.id, imageable_type: "Vineyard"
        ) 
      }
      describe "from a vineyard page" do 
        
        Given { request.env["HTTP_REFERER"] = vineyard_path(vineyard) }
        Then { 
          assert_difference(['vineyard.images.count','Image.count']) { 
            post :create, image: vineyard_image_attrs
          }
        }
        And { assert_redirected_to vineyard_path(vineyard) }
      end
    end
  end
end
