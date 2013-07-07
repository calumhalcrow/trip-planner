class Connection
  include Mongoid::Document
  include Mongoid::Timestamps

  field :depart_at, type: DateTime
  field :arrive_at, type: DateTime
  field :name, type: String

  has_one :stop
  belongs_to :trip
end
