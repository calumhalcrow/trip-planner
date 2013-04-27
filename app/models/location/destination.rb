class Location::Destination
  include Mongoid::Document
  embedded_in :trip
end
