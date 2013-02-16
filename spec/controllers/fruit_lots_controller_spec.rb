require 'spec_helper'

describe FruitLotsController do

  Given(:valid_attributes) { FactoryGirl.attributes_for(:fruit_lot) }
  Given!(:fruit_lot) { FactoryGirl.create(:fruit_lot) }

  def valid_session
    {}
  end

  describe "GET 'index'" do
    
    When { get :index, {}, valid_session }
    
    describe "returns http success" do
      
      Then { response.should be_success }
    end

    describe "assigns fruit lots to @fruit_lots" do 

      Then { assigns(:fruit_lots).should include fruit_lot }
    end
  end

  describe "GET 'show'" do
    
    When { get :show, { id: fruit_lot.to_param }, valid_session }

    describe "returns http success" do
      
      Then { response.should be_success }
    end
  end

  describe "GET 'new'" do

    When { get :new, {}, valid_session } 
      
    describe "returns http success" do
    
      Then { response.should be_success }
    end

    describe "assigns a new fruit lot as @fruit_lot" do 
      
      Then { assigns(:fruit_lot).should be_a_new(FruitLot) }
    end
  end

  describe "GET 'edit'" do

    When { get 'edit', { id: fruit_lot.to_param }, valid_session }
    
    describe "returns http success" do

      Then { response.should be_success }
    end

    describe "assigns the requested vineyard as @vineyard" do
      
      Then { assigns(:fruit_lot).should eq(fruit_lot) }
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
    
      it "creates a new FruitLot" do
        expect {
          post :create, {:fruit_lot => valid_attributes}, valid_session
        }.to change(FruitLot, :count).by(1)
      end

      it "assigns a newly created fruit lot as @fruit_lot" do
        post :create, { fruit_lot: valid_attributes}, valid_session
        assigns(:fruit_lot).should be_a(FruitLot)
        assigns(:fruit_lot).should be_persisted
      end

      it "redirects to the created vineyard" do
        post :create, { fruit_lot: valid_attributes}, valid_session
        response.should redirect_to(FruitLot.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fruit lot as @fruit_lot" do
        FruitLot.any_instance.stub(:save).and_return(false)
        post :create, { fruit_lot: { "wine_id" => "invalid value" } }, valid_session
        assigns(:fruit_lot).should be_a_new(FruitLot)
      end

      it "re-renders the 'new' template" do
        FruitLot.any_instance.stub(:save).and_return(false)
        post :create, { fruit_lot: { "wine_id" => "invalid value" } }, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT 'update'" do

    describe "with valid params" do 

      it "updates the requested fruit lot" do
        FruitLot.any_instance.should_receive(:update_attributes).with({ "wine_id" => "1" })
        put :update, { id: fruit_lot.to_param, fruit_lot: { "wine_id" => "1" }}, valid_session
      end

      it "assigns the requested fruit_lot as @fruit_lot" do
        put :update, { id: fruit_lot.to_param, fruit_lot: valid_attributes}, valid_session
        assigns(:fruit_lot).should eq(fruit_lot)
      end

      it "redirects to the fruit_lot" do
        put :update, { id: fruit_lot.to_param, fruit_lot: valid_attributes}, valid_session
        response.should redirect_to(fruit_lot)
      end
    end

    describe "with invalid params" do
      
      it "assigns the fruit_lot as @fruit_lot" do
        FruitLot.any_instance.stub(:save).and_return(false)
        put :update, { id: fruit_lot.to_param, fruit_lot: { "wine_id" => "invalid value" }}, valid_session
        assigns(:fruit_lot).should eq(fruit_lot)
      end

      it "re-renders the 'edit' template" do
        FruitLot.any_instance.stub(:save).and_return(false)
        put :update, { id: fruit_lot.to_param, fruit_lot: { "wine_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do

    it "destroys the requested fruit lot" do

      expect {
        delete :destroy, { id: fruit_lot.to_param}, valid_session
      }.to change(FruitLot, :count).by(-1)
    end

    it "redirects to the fruit lot list" do
      fruit_lot = FruitLot.create! valid_attributes
      delete :destroy, { id: fruit_lot.to_param}, valid_session 
      response.should redirect_to(fruit_lots_url)
    end
  end
end
