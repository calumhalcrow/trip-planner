#!/usr/bin/env rake

namespace :data do
  desc "Add some sample data to the DB."

  task :sample => :environment do
    user = User.create(:name => 'Calum Halcrow', :email => 'c@h.com')
    user.create_home(:name => '3A-16-3A')

    trip = Trip.create(:name => 'Back-packing to Bangkok', :user => user)
    trip.create_destination(:name => 'Bangkok')

    location = Location.create(:name => 'Suvarnabhumi Airport')
    Connection.create(:name => 'KLIA to BKK', :location => location, :trip => trip)
  end

end

