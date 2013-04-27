require 'spec_helper'

describe "location/homes/index" do
  before(:each) do
    assign(:location_homes, [
      stub_model(Location::Home),
      stub_model(Location::Home)
    ])
  end

  it "renders a list of location/homes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
