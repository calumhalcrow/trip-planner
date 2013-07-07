require 'factory_girl_rails'

FactoryGirl.define do

  factory :user do
    name "John Doe"
    email  "johndoe@example.com"
  end

  factory :trip do
    name "Penang Summer Getaway"
    user
  end

  factory :destination do
    name "Penang"
    trip
  end

  factory :connection do
    depart_at 3.days.ago
    arrive_at 2.days.ago
    name "Home to airport"
    trip
  end

  factory :stop do
    name "E&O Georgetown"
    connection
  end

  factory :home do
    name "Where the heart is"
    user
  end

end
