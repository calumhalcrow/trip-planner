require 'factory_girl_rails'

FactoryGirl.define do

  factory :connection do
    depart_at 3.days.ago
    arrive_at 2.days.ago
    name "Home to airport"
    association :location
  end

  factory :location do
    name "E&O Georgetown"

    factory :destination, class: 'Location::Destination' do
      name "Penang"
    end

    factory :home, class: 'Location::Home' do
      name "Home"
    end
  end


  factory :trip do
    name "Penang Summer Getaway"
    association :user
    association :destination
  end

  factory :user do
    name "John Doe"
    email  "johndoe@example.com"
    association :home
  end
end
