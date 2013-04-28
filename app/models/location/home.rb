class Location::Home < Location
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
end
