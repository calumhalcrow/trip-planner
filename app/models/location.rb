class Location
  include Mongoid::Document
  field :name, type: String
  belongs_to :connection, inverse_of: :from
  belongs_to :connection, inverse_of: :to
end
