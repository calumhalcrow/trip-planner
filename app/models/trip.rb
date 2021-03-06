class Trip
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :destination, type: String

  has_many :connections
  belongs_to :user

  validates :user, :presence => true
end
