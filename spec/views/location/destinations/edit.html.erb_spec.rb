require 'spec_helper'

describe "location/destinations/edit" do
  before(:each) do
    @location_destination = assign(:location_destination, stub_model(Location::Destination))
  end

  it "renders the edit location_destination form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", location_destination_path(@location_destination), "post" do
    end
  end
end
