class Location::Home
  include Mongoid::Document
  belongs_to :user
end
