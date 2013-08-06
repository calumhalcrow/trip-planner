class Connection
  include Mongoid::Document
  include Mongoid::Timestamps

  field :depart_at, type: DateTime
  field :arrive_at, type: DateTime
  field :name, type: String
  field :stop, type: String

  belongs_to :trip
end
