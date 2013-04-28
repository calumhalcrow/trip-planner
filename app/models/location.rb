class Location
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  has_many :connections, inverse_of: :from
  has_many :connections, inverse_of: :to
end
