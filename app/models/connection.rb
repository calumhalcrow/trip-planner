class Connection
  include Mongoid::Document
  include Mongoid::Timestamps

  field :depart_at, type: DateTime
  field :arrive_at, type: DateTime
  field :name, type: String

  belongs_to :from, class_name: 'Location', inverse_of: nil
  belongs_to :to, class_name: 'Location', inverse_of: nil
  belongs_to :trip
end
