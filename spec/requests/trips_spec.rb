require 'spec_helper'

describe "Trips" do

  describe "GET /trips" do
    it "Gets an existing trip." do
      trip = FactoryGirl.create(:trip)

      get "/trips/#{trip.id}"

      response.status.should be(200)
    end
  end

  describe "POST /trips" do
    it "Creates a new trip." do
      user = FactoryGirl.create(:user, :name => 'Muggins')

      trip_info = {
        :trip => {
          :name => 'Winter Seaside.',
          :user_id => user.id,
          :destination => 'Pantai Cherating',
          :connections => [{:name => 'Conn1'}],
        },
      }

      post "/trips/", trip_info

      response.status.should be(200)

      body = ActiveSupport::JSON.decode(response.body)
      body['trip']['destination'].should eq('Pantai Cherating')
    end
  end

  describe "DELETE /trips" do
    it "Deletes an existing trip." do
      trip = FactoryGirl.create(:trip)
      delete "/trips/#{trip.id}"

      response.status.should be(200)

      body = ActiveSupport::JSON.decode(response.body)

      expect{Trip.find(body['trip']['id'])}.to
        raise_error(Mongoid::Errors::DocumentNotFound)
    end
  end

end
