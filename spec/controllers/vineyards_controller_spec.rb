require 'spec_helper'


describe VineyardsController do

  def valid_attributes
    { producer_id: "1",
    "name" => "random name" }
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all vineyards as @vineyards" do
      vineyard = Vineyard.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vineyards).should eq([vineyard])
    end
  end

  describe "GET show" do
    it "assigns the requested vineyard as @vineyard" do
      vineyard = Vineyard.create! valid_attributes
      get :show, {:id => vineyard.to_param}, valid_session
      assigns(:vineyard).should eq(vineyard)
    end
  end

  describe "GET new" do
    it "assigns a new vineyard as @vineyard" do
      get :new, {}, valid_session
      assigns(:vineyard).should be_a_new(Vineyard)
    end
  end

  describe "GET edit" do
    it "assigns the requested vineyard as @vineyard" do
      vineyard = Vineyard.create! valid_attributes
      get :edit, {:id => vineyard.to_param}, valid_session
      assigns(:vineyard).should eq(vineyard)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vineyard" do
        expect {
          post :create, {:vineyard => valid_attributes}, valid_session
        }.to change(Vineyard, :count).by(1)
      end

      it "assigns a newly created vineyard as @vineyard" do
        post :create, {:vineyard => valid_attributes}, valid_session
        assigns(:vineyard).should be_a(Vineyard)
        assigns(:vineyard).should be_persisted
      end

      it "redirects to the created vineyard" do
        post :create, {:vineyard => valid_attributes}, valid_session
        response.should redirect_to(Vineyard.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vineyard as @vineyard" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vineyard.any_instance.stub(:save).and_return(false)
        post :create, {:vineyard => { "producer_id" => "invalid value" }}, valid_session
        assigns(:vineyard).should be_a_new(Vineyard)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vineyard.any_instance.stub(:save).and_return(false)
        post :create, {:vineyard => { "producer_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do

    describe "with valid params" do
      
      it "updates the requested vineyard" do
        vineyard = Vineyard.create! valid_attributes
        Vineyard.any_instance.should_receive(:update_attributes).with({ "producer_id" => "1" })
        put :update, {:id => vineyard.to_param, :vineyard => { "producer_id" => "1" }}, valid_session
      end

      it "assigns the requested vineyard as @vineyard" do
        vineyard = Vineyard.create! valid_attributes
        put :update, {:id => vineyard.to_param, :vineyard => valid_attributes}, valid_session
        assigns(:vineyard).should eq(vineyard)
      end

      it "redirects to the vineyard" do
        vineyard = Vineyard.create! valid_attributes
        put :update, {:id => vineyard.to_param, :vineyard => valid_attributes}, valid_session
        response.should redirect_to(vineyard)
      end
    end

    describe "with invalid params" do
      it "assigns the vineyard as @vineyard" do
        vineyard = Vineyard.create! valid_attributes
        Vineyard.any_instance.stub(:save).and_return(false)
        put :update, {:id => vineyard.to_param, :vineyard => { "producer_id" => "invalid value" }}, valid_session
        assigns(:vineyard).should eq(vineyard)
      end

      it "re-renders the 'edit' template" do
        vineyard = Vineyard.create! valid_attributes
        Vineyard.any_instance.stub(:save).and_return(false)
        put :update, {:id => vineyard.to_param, :vineyard => { "producer_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vineyard" do
      vineyard = Vineyard.create! valid_attributes
      expect {
        delete :destroy, {:id => vineyard.to_param}, valid_session
      }.to change(Vineyard, :count).by(-1)
    end

    it "redirects to the vineyards list" do
      vineyard = Vineyard.create! valid_attributes
      delete :destroy, {:id => vineyard.to_param}, valid_session
      response.should redirect_to(vineyards_url)
    end
  end

end
