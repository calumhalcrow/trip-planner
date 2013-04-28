require 'spec_helper'

describe Trip do
  it 'allows a valid trip to be created' do
    user = User.create(:name => 'Mr T', :email => 'mr-t@a-team.tld')
    Location::Home.create(:name => 'Home', :user => user)

    trip = Trip.create(:name => 'Cherating Getaway', :user => user)

    trip.persisted?.should be_true
    trip.valid?.should be_true

    Location::Destination.create(:name => 'Cherating', :trip => trip)

    trip.destination.persisted?.should be_true

    connection = Connection.create(
      :name => 'Home to KLIA',
      :depart_at => Time.utc(2013,"may",15,8,0,0),
      :arrive_at => Time.utc(2013,"may",15,13,0,0),
      :from => user.home,
      :to => trip.destination,
      :trip => trip,
    )

    trip.connections[0].persisted?.should be_true
    trip.connections[0].name.should eq 'Home to KLIA'
    trip.connections[0].from.id.should eq user.home.id
  end
end
