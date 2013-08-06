require 'spec_helper'

describe "Trips" do

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

end
