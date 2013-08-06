class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :destination
  has_many :connections
  embed :ids, include: true
end
