class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :home
  has_many :trips
  embed :ids, include: true
end
