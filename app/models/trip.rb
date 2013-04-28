class Trip
  include Mongoid::Document
  field :name, type: String
  has_one :destination, class_name: "Location::Destination"
  embeds_many :connections
  belongs_to :user
end
