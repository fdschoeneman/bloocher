require "test_helper"


describe ImagesController do 

include Rails.application.routes.url_helpers
  Given(:user) { create(:user) }
  Given(:producer) { create(:producer) }
  Given(:winery) { create(:winery) }
  Given(:wine) { create(:vineyard) }
  Given(:artist) { create(:artist) }
  Given(:showcase) { create(:showcase) }
  
  
  Given(:image_attrs) { attributes_for(:image) }

  describe "create" do 

    %w[producer winery vineyard showcase wine artist].each do |model|

      Given(:resource) { create(model.to_sym) }

      describe "logged out user" do
        
        Given { sign_out user }

        describe "cannot create an image for #{model}" do 
          Then { assert_no_difference(['Image.count', 'resource.images.count']) { 
            post :create, { 
              image: image_attrs, imageable_id: resource, imageable_type: resource.class.name 
              }
            } 
          }
          And { assert_redirected_to new_user_session_path }
        end
      end

      describe "as logged in user" do

        Given { sign_in user } 
        
        describe "from #{model} show page" do 
          Given(:resource_path) {
            url_for(controller: resource.class.name.downcase.pluralize,
                        action: 'show',
                        id: resource.id,
                        only_path: true)
          }
          Given { request.env["HTTP_REFERER"] = resource_path }
          Then { 
            assert_difference('Image.count') { 
              post :create, image: image_attrs 
            } 
          }
          And { assert_redirected_to resource_path } 

        # Given(:producer) { create(:producer) }
        # Given(:producer_image_attrs) { 
        #   attributes_for(
        #     :image, imageable_id: producer.id, imageable_type: "Producer"
        #   ) 
        # }
        # describe "from a producer page" do 
          
        #   Given { request.env["HTTP_REFERER"] = producer_path(producer) }
        #   Then { 
        #     assert_difference(['producer.images.count','Image.count']) { 
        #       post :create, image: producer_image_attrs
        #     }
        #   }
        #   And { assert_redirected_to producer_path(producer) }
        # end

        # Given(:winery) { create(:winery) }
        # Given(:winery_image_attrs) { 
        #   attributes_for(
        #     :image, imageable_id: winery.id, imageable_type: "Winery"
        #   ) 
        # }

        # describe "from a winery page" do 
          
        #   Given { request.env["HTTP_REFERER"] = winery_path(winery) }
        #   Then { 
        #     assert_difference(['winery.images.count','Image.count']) { 
        #       post :create, image: winery_image_attrs
        #     }
        #   }
        #   And { assert_redirected_to winery_path(winery) }
        # end

        # Given(:vineyard) { create(:vineyard) }
        # Given(:vineyard_image_attrs) { 
        #   attributes_for(
        #     :image, imageable_id: vineyard.id, imageable_type: "Vineyard"
        #   ) 
        # }
        # describe "from a vineyard page" do 
          
        #   Given { request.env["HTTP_REFERER"] = vineyard_path(vineyard) }
        #   Then { 
        #     assert_difference(['vineyard.images.count','Image.count']) { 
        #       post :create, image: vineyard_image_attrs
        #     }
        #   }
        #   And { assert_redirected_to vineyard_path(vineyard) }
        # end
        end
      end
    end
  end
end
