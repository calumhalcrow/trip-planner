require 'spec_helper'

describe "Location::Homes" do
  describe "GET /location_homes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get location_homes_path
      response.status.should be(200)
    end
  end
end
