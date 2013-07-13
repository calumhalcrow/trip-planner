class ConnectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :depart_at, :arrive_at
  has_one :stop
  embed :ids, include: true
end
