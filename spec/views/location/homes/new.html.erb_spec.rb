require 'spec_helper'

describe "location/homes/new" do
  before(:each) do
    assign(:location_home, stub_model(Location::Home).as_new_record)
  end

  it "renders new location_home form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", location_homes_path, "post" do
    end
  end
end
