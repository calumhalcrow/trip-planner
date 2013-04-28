class Connection
  include Mongoid::Document
  include Mongoid::Timestamps

  field :depart_at, type: DateTime
  field :arrive_at, type: DateTime
  field :name, type: String
  has_one :from, class_name: "Location"
  has_one :to, class_name: "Location"
  embedded_in :trip
end
