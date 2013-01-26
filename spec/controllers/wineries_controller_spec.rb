require 'spec_helper'

describe WineriesController do

  def valid_attributes
    { "name" => "MyString", "producer_id" => "1" }
  end

  def valid_session
    {}
  end

  describe "GET index" do
  
    describe "should respond with 200 code" do 

      When { get :index }
      Then { expect(response.code).to eq("200") }
    end

    it "assigns all wineries as @wineries" do
      winery = Winery.create! valid_attributes
      get :index, {}, valid_session
      assigns(:wineries).should eq([winery])
    end
  end

  describe "GET show" do
    it "assigns the requested winery as @winery" do
      winery = Winery.create! valid_attributes
      get :show, {:id => winery.to_param}, valid_session
      assigns(:winery).should eq(winery)
    end
  end

  describe "GET new" do
    it "assigns a new winery as @winery" do
      get :new, {}, valid_session
      assigns(:winery).should be_a_new(Winery)
    end
  end

  describe "GET edit" do
    it "assigns the requested winery as @winery" do
      winery = Winery.create! valid_attributes
      get :edit, {:id => winery.to_param}, valid_session
      assigns(:winery).should eq(winery)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Winery" do
        expect {
          post :create, {:winery => valid_attributes}, valid_session
        }.to change(Winery, :count).by(1)
      end

      it "assigns a newly created winery as @winery" do
        post :create, {:winery => valid_attributes}, valid_session
        assigns(:winery).should be_a(Winery)
        assigns(:winery).should be_persisted
      end

      it "redirects to the created winery" do
        post :create, {:winery => valid_attributes}, valid_session
        response.should redirect_to(Winery.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved winery as @winery" do
        # Trigger the behavior that occurs when invalid params are submitted
        Winery.any_instance.stub(:save).and_return(false)
        post :create, {:winery => { "name" => "invalid value" }}, valid_session
        assigns(:winery).should be_a_new(Winery)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Winery.any_instance.stub(:save).and_return(false)
        post :create, {:winery => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested winery" do
        winery = Winery.create! valid_attributes
        # Assuming there are no other wineries in the database, this
        # specifies that the Winery created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Winery.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => winery.to_param, :winery => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested winery as @winery" do
        winery = Winery.create! valid_attributes
        put :update, {:id => winery.to_param, :winery => valid_attributes}, valid_session
        assigns(:winery).should eq(winery)
      end

      it "redirects to the winery" do
        winery = Winery.create! valid_attributes
        put :update, {:id => winery.to_param, :winery => valid_attributes}, valid_session
        response.should redirect_to(winery)
      end
    end

    describe "with invalid params" do
      it "assigns the winery as @winery" do
        winery = Winery.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Winery.any_instance.stub(:save).and_return(false)
        put :update, {:id => winery.to_param, :winery => { "name" => "invalid value" }}, valid_session
        assigns(:winery).should eq(winery)
      end

      it "re-renders the 'edit' template" do
        winery = Winery.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Winery.any_instance.stub(:save).and_return(false)
        put :update, {:id => winery.to_param, :winery => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested winery" do
      winery = Winery.create! valid_attributes
      expect {
        delete :destroy, {:id => winery.to_param}, valid_session
      }.to change(Winery, :count).by(-1)
    end

    it "redirects to the wineries list" do
      winery = Winery.create! valid_attributes
      delete :destroy, {:id => winery.to_param}, valid_session
      response.should redirect_to(wineries_url)
    end
  end

end
