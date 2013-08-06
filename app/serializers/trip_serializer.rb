class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :destination
  has_many :connections
end
