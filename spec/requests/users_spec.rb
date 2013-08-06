require 'spec_helper'
require 'factory_girl_rails'

describe "Users" do
  describe "GET /users" do
    it "Gets all users." do
      get users_path
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
    end
  end

  describe "POST /users/" do
    it "Creates a new user." do
      post "/users/", {:user => {:name => 'Calum', :email => 'calum@example.com'}}
      response.status.should be(200)
    end
  end
end
