class Destination
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  belongs_to :trip
end
