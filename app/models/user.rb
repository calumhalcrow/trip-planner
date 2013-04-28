class User
  include Mongoid::Document
  field :name, type: String
  has_many :trips
  has_one :home, class_name: "Location::Home"
end
