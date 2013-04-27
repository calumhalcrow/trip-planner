require 'spec_helper'

describe "connections/new" do
  before(:each) do
    assign(:connection, stub_model(Connection).as_new_record)
  end

  it "renders new connection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", connections_path, "post" do
    end
  end
end
