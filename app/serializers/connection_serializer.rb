class ConnectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :depart_at, :arrive_at, :stop
  embed :ids, include: true
end
