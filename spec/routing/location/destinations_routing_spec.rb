require "spec_helper"

describe Location::DestinationsController do
  describe "routing" do

    it "routes to #index" do
      get("/location/destinations").should route_to("location/destinations#index")
    end

    it "routes to #new" do
      get("/location/destinations/new").should route_to("location/destinations#new")
    end

    it "routes to #show" do
      get("/location/destinations/1").should route_to("location/destinations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/location/destinations/1/edit").should route_to("location/destinations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/location/destinations").should route_to("location/destinations#create")
    end

    it "routes to #update" do
      put("/location/destinations/1").should route_to("location/destinations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/location/destinations/1").should route_to("location/destinations#destroy", :id => "1")
    end

  end
end
