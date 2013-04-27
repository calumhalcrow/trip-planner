require 'spec_helper'

describe "location/destinations/index" do
  before(:each) do
    assign(:location_destinations, [
      stub_model(Location::Destination),
      stub_model(Location::Destination)
    ])
  end

  it "renders a list of location/destinations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
