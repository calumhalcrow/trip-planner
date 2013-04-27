require 'spec_helper'

describe "location/destinations/show" do
  before(:each) do
    @location_destination = assign(:location_destination, stub_model(Location::Destination))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
