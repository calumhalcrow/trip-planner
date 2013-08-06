require 'factory_girl_rails'

FactoryGirl.define do

  factory :user do
    name "John Doe"
    email "johndoe@example.com"
    home "123 Jalan 45"
  end

  factory :trip do
    name "Penang Summer Getaway"
    destination "Penang"
    user
  end

  factory :connection do
    depart_at 3.days.ago
    arrive_at 2.days.ago
    name "Home to airport"
    stop "E&O Georgetown"
    trip
  end

end
