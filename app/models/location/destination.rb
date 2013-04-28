class Location::Destination < Location
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :trip
end
