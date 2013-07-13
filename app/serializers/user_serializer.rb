class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :trips
  has_one :home
  embed :ids, include: true
end
