require 'spec_helper'
require 'factory_girl_rails'

describe "Users" do
  describe "GET /users" do
    it "Gets all users." do
      get users_path, format: :json
      response.status.should be(200)
    end
  end

  describe "GET /users/:id" do
    it "Gets a single user by id." do
      user = FactoryGirl.create(:user, :name => 'Muggins')
      get "/users/#{user.id}"
      response.status.should be(200)

      body = ActiveSupport::JSON.decode(response.body)
      body['user']['name'].should eq('Muggins')
      body['user']['home_id'].should be_nil

      home = FactoryGirl.create(:home)
      get "/users/#{home.user.id}"
      response.status.should be(200)

      body = ActiveSupport::JSON.decode(response.body)
      body['user']['home_id'].should_not be_nil
    end
  end
end
