class Location
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  belongs_to :connection, inverse_of: :from
  belongs_to :connection, inverse_of: :to
end
