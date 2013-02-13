require 'spec_helper'

describe WinesController do

  Given(:wine) { FactoryGirl.create(:wine) }# , winery_id: winery.id)}
  Given(:wine_with_reviews) { FactoryGirl.create(:wine_with_reviews)}
  Given(:wine_with_fruit_lots) { FactoryGirl.create(:wine_with_fruit_lots) }
  # Given(:wine_with_vineyards) { FactoryGirl.create(:wine_with_fruit_lots) }
  Given(:valid_session) {  }
 
  describe "GET index should assign all wines to @wines" do 

    When { get :index, {}, valid_session }
    Then { assigns(:wines).should include wine }

    context "including wines that have reviews" do 
      
      Then { assigns(:wines).should include wine_with_reviews }
    end

    context "including wines that have fruit lots" do 
      
      Then { assigns(:wines).should include wine_with_fruit_lots }
    end
  end

  describe "GET show action" do
    
    describe "should assign the wine to its view" do 
    
      context "when the wine has no reviews or vineyards" do 

        When { get :show, { id: wine.to_param}, valid_session }
        Then { assigns(:wine).should eq wine }
      end

      context "when the wine has reviews" do 

        When { get :show, { id: wine_with_reviews.to_param}, valid_session }
        Then { assigns(:wine).should eq wine_with_reviews }

        context "it should assign a wines reviews to its view" do 

          Then { assigns(:reviews).should eq wine_with_reviews.reviews }
        end
      end
      
      context "when the wine has fruit_lots" do 

        When { get :show, { id: wine_with_fruit_lots.to_param}, valid_session }
        Then { assigns(:wine).should eq wine_with_fruit_lots }

        context "it should assign Fruit to its view" do 

          Then { assigns(:fruit_lots).should eq wine_with_fruit_lots.fruit_lots }
        
          context "assign vineyards" do 

            Then { assigns(:vineyards).should eq wine_with_fruit_lots.vineyards }
          end
        end
      end
    end
  end

  Given(:valid_attributes) { FactoryGirl.attributes_for(:wine, winery_id: 1) }
  Given(:vineyard) { FactoryGirl.create(:vineyard)}


  describe "GET new" do

    it "assigns a new wine as @wine" do
      get :new, {}, valid_session
      assigns(:wine).should be_a_new(Wine)
    end
  end

  describe "GET edit" do
    it "assigns the requested wine as @wine" do
      get :edit, {:id => wine.to_param}, valid_session
      assigns(:wine).should eq(wine)
    end
  end

  describe "POST create" do

    describe "with valid params" do

      it "creates a new Wine" do

        expect {
          post :create, {:wine => valid_attributes}, valid_session
        }.to change(Wine, :count).by(1)
      end

      describe "assigns a newly created wine as @wine" do
        When { post :create, { wine: valid_attributes}, valid_session }
        Then { assigns(:wine).should be_a(Wine) }
        Then { assigns(:wine).should be_persisted }
      end

      it "redirects to the created wine" do
        post :create, {:wine => valid_attributes}, valid_session

        response.should redirect_to(Wine.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved wine as @wine" do
        # Trigger the behavior that occurs when invalid params are submitted
        Wine.any_instance.stub(:save).and_return(false)
        post :create, {:wine => { "vintage" => "invalid value" }}, valid_session
        assigns(:wine).should be_a_new(Wine)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Wine.any_instance.stub(:save).and_return(false)
        post :create, {:wine => { "vintage" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do

    describe "with valid params" do

      it "updates the requested wine" do
        Wine.any_instance.should_receive(:update_attributes).with({ "vintage" => "1" })
        put :update, {:id => wine.to_param, :wine => { "vintage" => "1" }}, valid_session
      end

      it "assigns the requested wine as @wine" do

        put :update, {:id => wine.to_param, :wine => valid_attributes}, valid_session
        assigns(:wine).should eq(wine)
      end

      it "redirects to the wine" do

        put :update, {:id => wine.to_param, :wine => valid_attributes}, valid_session
        response.should redirect_to(wine)
      end
    end

    describe "with invalid params" do

      it "assigns the wine as @wine" do

        Wine.any_instance.stub(:save).and_return(false)
        put :update, {:id => wine.to_param, :wine => { "vintage" => "invalid value" }}, valid_session
        assigns(:wine).should eq(wine)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Wine.any_instance.stub(:save).and_return(false)
        put :update, {:id => wine.to_param, :wine => { "vintage" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested wine" do
      wine
      expect {
        delete :destroy, {:id => wine.to_param}, valid_session
      }.to change(Wine, :count).by(-1)
    end

    it "redirects to the wines list" do
      delete :destroy, {:id => wine.to_param}, valid_session
      response.should redirect_to(wines_url)
    end
  end
end
