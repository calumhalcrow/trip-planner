require 'spec_helper'

describe "location/destinations/new" do
  before(:each) do
    assign(:location_destination, stub_model(Location::Destination).as_new_record)
  end

  it "renders new location_destination form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", location_destinations_path, "post" do
    end
  end
end
