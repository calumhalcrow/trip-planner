class Location::Destination < Location
  include Mongoid::Document
  belongs_to :trip
end
