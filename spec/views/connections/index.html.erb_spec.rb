require 'spec_helper'

describe "connections/index" do
  before(:each) do
    assign(:connections, [
      stub_model(Connection),
      stub_model(Connection)
    ])
  end

  it "renders a list of connections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
