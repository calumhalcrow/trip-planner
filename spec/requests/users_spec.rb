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
    it "Get a single user by id." do
      home = FactoryGirl.create(:home)
      get "/users/#{home.user.id}", format: :json
      response.status.should be(200)
    end
  end
end
