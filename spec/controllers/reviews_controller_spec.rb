require 'spec_helper'

describe ReviewsController do

  Given(:review)    { FactoryGirl.create(:review) }
  Given(:reviewer)  { FactoryGirl.create(:user) }
  Given(:wine)      { FactoryGirl.create(:wine) }
  Given(:valid_session) { }

  describe "GET index" do
    
    it "assigns all reviews as @reviews" do

      get :index, valid_session
      assigns(:reviews).should eq([review])
    end
  end

  describe "GET show" do
    
    it "assigns the requested review as @review" do
      
      get :show, { id: review.to_param }, valid_session
      assigns(:review).should eq(review)
    end
  end

  describe "GET new" do

    context "with logged in user" do 
      
      When { sign_in review.reviewer }

      describe "assigns a new review as @review" do
        
        When { get :new, { wine: review.wine.to_param }, valid_session }
        Then { assigns(:review).should be_a_new(Review) }
      end
    end

    context "without logged in user" do 

      When { logout } 

      describe "redirects to login" do
        
        When { get :new, { wine: review.wine.to_param }, valid_session }
        Then { response.should redirect_to(new_user_session_path) }
      end
    end
  end

  describe "GET edit" do

    context "with logged in user" do 

      When { sign_in review.reviewer }

      describe "assigns the requested review as @review" do

        When { get :edit, { id: review.to_param}, valid_session }
        Then { assigns(:review).should eq(review) }
      end
    end
  end


  describe "POST create" do
    
    describe "with logged in user" do

      Given { sign_in reviewer }
      
      describe "and valid attributes" do

        describe "via pro-notes" do 

          Then { expect { post :create, { 
                review: FactoryGirl.attributes_for(:review), wine_id: wine.id
          } }.to change(Review, :count).by(1) }
        end

        describe "via bloochinator" do 

          Then { expect { post :create, { 
                review: FactoryGirl.attributes_for(:blooch, content: nil), wine_id: wine.id
          } }.to change(Review, :count).by(1) }
        end


      end

      describe "assigns a newly created review as @review" do
        
        When { post :create, { review: FactoryGirl.attributes_for(:review) } }
        Then { assigns(:review).should be_a(Review) }
        
        describe "and the new review should be persisted" do 

          Then { assigns(:review).should be_persisted }
        end
      end

      describe "invalid attributes re-renders the 'new' template" do

        When { post :create, { 
          review: FactoryGirl.attributes_for(:review, wine_id: "invalid") }, valid_session }
        Then { response.should render_template("new") }
      end
    end

    describe "without logged in user" do

      Given { logout }
      
      describe "without new user email for simultaneous signup" do
        
        When(:review) { FactoryGirl.attributes_for(:review, user: {email: ""}) }

        describe "Does not save a review" do

          Then { expect { post :create, review: review  
            }.to_not change(Review, :count).by(1) 
          }
        end
      end
    end

    describe "with new user email for simultaneous signup" do

      When(:review) { FactoryGirl.attributes_for(
        :review, user: { email: "some@email.com" } )
      }

      describe "Saves a review" do

        Then { expect {
          post  :create, { review: review} 
          }.to change(Review, :count).by(1) 
        }
      end
    end
  end

  describe "PUT update" do

    describe "with logged in user" do
      
      Given { sign_in reviewer }

      describe "finds the correct review for updating" do
        
        When { put :update, id: review, 
          review: FactoryGirl.attributes_for(:review) } 

        Then { assigns(:review).should eq (review) }
      end

      describe "changes the review's attributes" do 

        When { put :update, id: review, 
          review: FactoryGirl.attributes_for(:review, content: "updated content") }
        When { review.reload }
        Then { review.content.should eq "updated content" }

        describe "redirects to the review" do
          
          Then { response.should redirect_to(wine_path(review.wine_id)) }
        end
      end

      Given(:invalid_review) { FactoryGirl.attributes_for(:review, content: nil) }

      describe "with invalid attributes" do 

        When { put :update, id: review, review: invalid_review } 
        
        describe "locates the requested review" do 

          Then { assigns(:review).should eq(review) } 
        
          describe "does not change review's attributes" do 

            When { put :update, id: review, review: invalid_review }
            When { review.reload }
            Then { review.content.should_not be_nil }

            describe "re-renders the edit method" do 
              
              Then { response.should render_template :edit }
            end
          end
        end
      end
    end

    describe "without logged in user" do 

      When { logout }

      describe "redirects to login" do 

        When { put :update, id: review, review: FactoryGirl.attributes_for(
          :review, content: "updated content") }
        Then { response.should redirect_to(new_user_session_path) }
      end
    end
  end

  describe "DELETE destroy" do

    Given { review }

    describe "with logged in user" do 

      When { sign_in review.reviewer }
      Then { 
        expect { delete :destroy, id: review }.to change(Review, :count).by(-1) 
      }

      describe "redirects to root" do 

        When { delete :destroy, id: review }
        Then { response.should redirect_to reviews_path }
      end
    end
  end
end
