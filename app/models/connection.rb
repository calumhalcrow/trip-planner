class Connection
  include Mongoid::Document
  field :from, type: Reference
  field :depart_at, type: Time
  field :arrive_at, type: Time
  field :name, type: Str
  embedded_in :to
end
