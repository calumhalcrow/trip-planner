class Connection
  include Mongoid::Document
  field :depart_at, type: Time
  field :arrive_at, type: Time
  field :name, type: String
  embeds_one :from, class_name: "Location", inverse_of: :departing_from
  embeds_one :to, class_name: "Location", inverse_of: :arriving_at
  embedded_in :trip
end
