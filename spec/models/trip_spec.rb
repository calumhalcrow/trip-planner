require 'spec_helper'

describe Trip do
  it 'allows a valid trip to be created' do
    user = User.create(:name => 'Mr T', :email => 'mr-t@a-team.tld')
    trip = Trip.create(:name => 'Cherating Getaway', :user => user)

    trip.persisted?.should be_true
    trip.valid?.should be_true

    Destination.create(:name => 'Cherating', :trip => trip)

    trip.destination.persisted?.should be_true

    stop = Stop.create(:name => 'Gerai Keropok Lekor')
    Connection.create(
      :name => 'Home to KLIA',
      :depart_at => Time.utc(2013,"may",15,8,0,0),
      :arrive_at => Time.utc(2013,"may",15,13,0,0),
      :stop => stop,
      :trip => trip,
    )

    trip.connections[0].persisted?.should be_true
    trip.connections[0].name.should eq 'Home to KLIA'
    trip.connections[0].stop.id.should eq stop.id
  end
end
