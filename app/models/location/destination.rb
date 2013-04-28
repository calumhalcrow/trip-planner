class Location::Destination
  include Mongoid::Document
  belongs_to :trip
end
