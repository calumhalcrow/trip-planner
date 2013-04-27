require 'spec_helper'

describe "location/homes/show" do
  before(:each) do
    @location_home = assign(:location_home, stub_model(Location::Home))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
