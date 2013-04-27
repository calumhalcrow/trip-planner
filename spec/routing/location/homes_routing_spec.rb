require "spec_helper"

describe Location::HomesController do
  describe "routing" do

    it "routes to #index" do
      get("/location/homes").should route_to("location/homes#index")
    end

    it "routes to #new" do
      get("/location/homes/new").should route_to("location/homes#new")
    end

    it "routes to #show" do
      get("/location/homes/1").should route_to("location/homes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/location/homes/1/edit").should route_to("location/homes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/location/homes").should route_to("location/homes#create")
    end

    it "routes to #update" do
      put("/location/homes/1").should route_to("location/homes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/location/homes/1").should route_to("location/homes#destroy", :id => "1")
    end

  end
end
