require 'spec_helper'

describe "connections/edit" do
  before(:each) do
    @connection = assign(:connection, stub_model(Connection))
  end

  it "renders the edit connection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", connection_path(@connection), "post" do
    end
  end
end
