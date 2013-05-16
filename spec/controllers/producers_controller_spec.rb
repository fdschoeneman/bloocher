require 'spec_helper'

describe ProducersController do

  def valid_attributes
    { "address_1" => "MyString" }
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all producers as @producers" do
      producer = Producer.create! valid_attributes
      get :index, {}, valid_session
      assigns(:producers).should eq([producer])
    end
  end

  describe "GET show" do
    it "assigns the requested producer as @producer" do
      producer = Producer.create! valid_attributes
      get :show, {:id => producer.to_param}, valid_session
      assigns(:producer).should eq(producer)
    end
  end

  describe "GET new" do
    it "assigns a new producer as @producer" do
      get :new, {}, valid_session
      assigns(:producer).should be_a_new(Producer)
    end
  end

  describe "GET edit" do
    it "assigns the requested producer as @producer" do
      producer = Producer.create! valid_attributes
      get :edit, {:id => producer.to_param}, valid_session
      assigns(:producer).should eq(producer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      xit "creates a new Producer" do
        expect {
          post :create, {:producer => valid_attributes}, valid_session
        }.to change(Producer, :count).by(1)
      end

      xit "assigns a newly created producer as @producer" do
        post :create, {:producer => valid_attributes}, valid_session
        assigns(:producer).should be_a(Producer)
        assigns(:producer).should be_persisted
      end

      xit "redirects to the created producer" do
        post :create, {:producer => valid_attributes}, valid_session
        response.should redirect_to(Producer.last)
      end
    end

    describe "with invalid params" do

      it "assigns a newly created but unsaved producer as @producer" do

        Producer.any_instance.stub(:save).and_return(false)
        post :create, {:producer => { "address_1" => "invalid value" }}, valid_session
        assigns(:producer).should be_a_new(Producer)
      end

      it "re-renders the 'new' template" do

        Producer.any_instance.stub(:save).and_return(false)
        post :create, {:producer => { "address_1" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested producer" do
        producer = Producer.create! valid_attributes
        # Assuming there are no other producers in the database, this
        # specifies that the Producer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Producer.any_instance.should_receive(:update_attributes).with({ "address_1" => "MyString" })
        put :update, {:id => producer.to_param, :producer => { "address_1" => "MyString" }}, valid_session
      end

      it "assigns the requested producer as @producer" do
        producer = Producer.create! valid_attributes
        put :update, {:id => producer.to_param, :producer => valid_attributes}, valid_session
        assigns(:producer).should eq(producer)
      end

      it "redirects to the producer" do
        producer = Producer.create! valid_attributes
        put :update, {:id => producer.to_param, :producer => valid_attributes}, valid_session
        response.should redirect_to(producer)
      end
    end

    describe "with invalid params" do
      it "assigns the producer as @producer" do
        producer = Producer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Producer.any_instance.stub(:save).and_return(false)
        put :update, {:id => producer.to_param, :producer => { "address_1" => "invalid value" }}, valid_session
        assigns(:producer).should eq(producer)
      end

      it "re-renders the 'edit' template" do
        producer = Producer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Producer.any_instance.stub(:save).and_return(false)
        put :update, {:id => producer.to_param, :producer => { "address_1" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested producer" do
      producer = Producer.create! valid_attributes
      expect {
        delete :destroy, {:id => producer.to_param}, valid_session
      }.to change(Producer, :count).by(-1)
    end

    it "redirects to the producers list" do
      producer = Producer.create! valid_attributes
      delete :destroy, {:id => producer.to_param}, valid_session
      response.should redirect_to(producers_url)
    end
  end

end
