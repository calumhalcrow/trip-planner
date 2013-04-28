class Trip
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  has_one :destination, class_name: "Location::Destination"
  has_many :connections
  belongs_to :user

  validates :user, :presence => true
end
