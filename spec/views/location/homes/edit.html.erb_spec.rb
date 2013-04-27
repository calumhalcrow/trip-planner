require 'spec_helper'

describe "location/homes/edit" do
  before(:each) do
    @location_home = assign(:location_home, stub_model(Location::Home))
  end

  it "renders the edit location_home form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", location_home_path(@location_home), "post" do
    end
  end
end
