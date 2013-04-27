require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TripsController do

  # This should return the minimal set of attributes required to create a valid
  # Trip. As you add validations to Trip, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TripsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all trips as @trips" do
      trip = Trip.create! valid_attributes
      get :index, {}, valid_session
      assigns(:trips).should eq([trip])
    end
  end

  describe "GET show" do
    it "assigns the requested trip as @trip" do
      trip = Trip.create! valid_attributes
      get :show, {:id => trip.to_param}, valid_session
      assigns(:trip).should eq(trip)
    end
  end

  describe "GET new" do
    it "assigns a new trip as @trip" do
      get :new, {}, valid_session
      assigns(:trip).should be_a_new(Trip)
    end
  end

  describe "GET edit" do
    it "assigns the requested trip as @trip" do
      trip = Trip.create! valid_attributes
      get :edit, {:id => trip.to_param}, valid_session
      assigns(:trip).should eq(trip)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Trip" do
        expect {
          post :create, {:trip => valid_attributes}, valid_session
        }.to change(Trip, :count).by(1)
      end

      it "assigns a newly created trip as @trip" do
        post :create, {:trip => valid_attributes}, valid_session
        assigns(:trip).should be_a(Trip)
        assigns(:trip).should be_persisted
      end

      it "redirects to the created trip" do
        post :create, {:trip => valid_attributes}, valid_session
        response.should redirect_to(Trip.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved trip as @trip" do
        # Trigger the behavior that occurs when invalid params are submitted
        Trip.any_instance.stub(:save).and_return(false)
        post :create, {:trip => {  }}, valid_session
        assigns(:trip).should be_a_new(Trip)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Trip.any_instance.stub(:save).and_return(false)
        post :create, {:trip => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested trip" do
        trip = Trip.create! valid_attributes
        # Assuming there are no other trips in the database, this
        # specifies that the Trip created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Trip.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => trip.to_param, :trip => { "these" => "params" }}, valid_session
      end

      it "assigns the requested trip as @trip" do
        trip = Trip.create! valid_attributes
        put :update, {:id => trip.to_param, :trip => valid_attributes}, valid_session
        assigns(:trip).should eq(trip)
      end

      it "redirects to the trip" do
        trip = Trip.create! valid_attributes
        put :update, {:id => trip.to_param, :trip => valid_attributes}, valid_session
        response.should redirect_to(trip)
      end
    end

    describe "with invalid params" do
      it "assigns the trip as @trip" do
        trip = Trip.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Trip.any_instance.stub(:save).and_return(false)
        put :update, {:id => trip.to_param, :trip => {  }}, valid_session
        assigns(:trip).should eq(trip)
      end

      it "re-renders the 'edit' template" do
        trip = Trip.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Trip.any_instance.stub(:save).and_return(false)
        put :update, {:id => trip.to_param, :trip => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested trip" do
      trip = Trip.create! valid_attributes
      expect {
        delete :destroy, {:id => trip.to_param}, valid_session
      }.to change(Trip, :count).by(-1)
    end

    it "redirects to the trips list" do
      trip = Trip.create! valid_attributes
      delete :destroy, {:id => trip.to_param}, valid_session
      response.should redirect_to(trips_url)
    end
  end

end
