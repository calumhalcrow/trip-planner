class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String

  validates :name, :presence => true, :length => { :minimum => 1, :allow_blank => false }
  validates :email, :presence => true, :length => { :minimum => 6, :allow_blank => false }

  has_many :trips
  has_one :home, class_name: "Location::Home"
end
