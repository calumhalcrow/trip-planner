class TripSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :destination
  has_many :connections
  embed :ids, include: true
end
