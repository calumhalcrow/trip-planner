#!/usr/bin/env rake

require 'factory_girl_rails'
require 'pp'

namespace :data do
  desc "Add some sample data to the DB."

  task :sample => :environment do
    user = FactoryGirl.create(:user, :name => 'CALUM')
    destination = FactoryGirl.create(:destination, :name => 'Bangkok')
    trip = FactoryGirl.create(:trip, :user => user, :name => 'Back-packing to Bangkok', :destination => destination)

    location = FactoryGirl.create(:location, :name => 'Suvarnabhumi Airport')
    FactoryGirl.create(:connection, :trip => trip, :name => 'KLIA to BKK', :location => location)
  end

end

