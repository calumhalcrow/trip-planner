class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_one :home
  embed :ids, include: true
end
