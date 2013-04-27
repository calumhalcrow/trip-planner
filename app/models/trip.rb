class Trip
  include Mongoid::Document
  field :name, type: String
  embeds_one :destination
  embeds_many :connections
  belongs_to :user
end
